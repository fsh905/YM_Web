/**
 * Created by Feng on 3/18/2017.
 */
let requestData = function(data, url, success, failed) {
    $.ajax({
      type: 'post',
      data: data,
      url: url,
      success: function (res) {
        success(res);
      },
      error: function (err) {
        failed(err);
      }
    })
  },
  init = function (data) {
    requestData(data, '/backend/products', function (res) {
      $('.product').remove();
      if (res.status == 200) {
        $('#show-msg').empty();
        let pageInfo = res.data,
          list = pageInfo.list;
        decorateList(list);
        decoratePage(pageInfo);
      } else {
        $('#show-msg').text("没有数据");
      }
    }, function (err) {
      console.log(err);
    });
  },
  decorateList = function (products) {
    //显示列表
    let header = $('#product-list-header');
    if (products === []) {
      $('#show-msg').text("没有数据");
      return;
    }
    products.forEach(function (pro) {
      let text = '<tr class="product">'+
        '<td align="center">' + pro.productId+
        '</td>'+
        '<td><a href="/product/'+pro.productId+'">'+pro.name+'</a></td>'+
        '<td align="center"><a href="product.php?cat_id=3">'+pro.description+'</a></td>'+
        '<td align="center"><a href="/user/info/'+pro.userId+'">'+pro.userName+'</a></td>'+
        '<td align="center">'+new Date(pro.upTime).toLocaleString()+'</td>'+
        '<td align="center">'+
        '<button class="past-btn" data-user-id='+pro.userId+' data-id="'+pro.productId+'">下架</button>'+
        '</td>'+
        '</tr>';
      header.after(text);
    })
  },
  decoratePage = function (pageInfo) {
    //显示页数，排序条件，搜索条件。。。
    let sort = $('select[name="sort"]').val(),
      keyword = $('input[name="keyword"]').val(),
      firstPage = '',
      lastPage = '',
      prePage = '',
      nextPage = '',
      text = '',
      pageShow = $('#page'),
      params = '';
    if (sort) {
      params += '&sort='+sort;
    }
    if (keyword) {
      params += '&keyword='+keyword;
    }
    firstPage = '<a href="/backend/products?page=1'+firstPage+params+'">第一页</a>';
    lastPage = '<a href="product.php?page='+lastPage + params+'">最末页</a>';
    if (pageInfo.hasPreviousPage) {
      prePage = '<a href="/backend/products?page='+pageInfo.prePage+params+'">上一页</a>;'
    }
    if (pageInfo.hasNextPage) {
      nextPage = '<a href="/backend/products?page='+pageInfo.nextPage+params+'">第一页</a>;'
    }
    text = '总计 '+pageInfo.total+' 个记录，共 '+pageInfo.pages+' 页，当前第 '+pageInfo.pageNum+' 页 |' + firstPage + prePage + nextPage + lastPage
    pageShow.empty();
    pageShow.append(text);
  };
$(document).on('click', '.past-btn', function () {
  //下架
  if (confirm("确定下架？")) {
    let self = $(this),
      id = self.attr('data-id'),
      userId = self.attr('data-user-id');
    requestData({userId: userId}, '/backend/products/'+id+'/past',function (res) {
      if (res.status == 200) {
        self.parent().parent().remove();
      } else {
        alert(res.msg);
      }
    }, function (err) {
      console.log(err);
    })
  }
});
$('form[name="search"]').submit(function (ev) {
  let sort = $('select[name="sort"]').val(),
    keyword = $('input[name="keyword"]').val();
  init({sort: sort, keyword: keyword});
  ev.preventDefault();
  return false;
});
init({});
