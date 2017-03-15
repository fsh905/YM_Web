package com.ym.er.controller;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ym.er.model.Category;
import com.ym.er.model.Product;
import com.ym.er.model.ProductImage;
import com.ym.er.model.Result;
import com.ym.er.service.CategoryService;
import com.ym.er.service.FavorProductService;
import com.ym.er.service.ProductService;
import com.ym.er.util.FileUtil;
import com.ym.er.util.StatusUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.lang.management.OperatingSystemMXBean;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

/**
 * Created by YM on 3/11/2017.
 *
 */
@Controller
@RequestMapping("/product")
public class ProductShowController {

    private final int PAGESIZE = 2;

    private ProductService productService;
    private CategoryService categoryService;
    private FavorProductService favorProductService;

    @Autowired
    public ProductShowController(ProductService productService, CategoryService categoryService, FavorProductService favorProductService) {
        this.productService = productService;
        this.categoryService = categoryService;
        this.favorProductService = favorProductService;
    }

    @GetMapping("/publish")
    public ModelAndView addNewProduct(ModelAndView modelAndView) {
        // 带上种类
        List<Category> bigCate = categoryService.selectBigCategory();
        modelAndView.addObject("bigCategory", bigCate);
        modelAndView.addObject("category", categoryService.selectCategoryByPId(bigCate.get(0).getId()));
        modelAndView.setViewName("product/publish");
        return modelAndView;
    }

    @RequestMapping(value = "/publish", method = RequestMethod.POST)
    @ResponseBody
    public Result<Product> addNewProduct(@SessionAttribute("userId")int userId, Product product, @RequestParam("addImages")MultipartFile files[]) {
        //save product get productId
        product.setUserId(userId);
        Result<Product> productResult = productService.insertProduct(product);
        if (productResult.getStatus() == 200) {
            int productId = productResult.getData().getProductId();
            // save img
            List<ProductImage> images = getImgs(FileUtil.saveMultiImgs(files), productId);
            Result<List<ProductImage>> result = productService.insertProductImage(images);
            //跳转到详情页面
            return productResult;
        } else {

            return Result.build(400, "添加失败");
        }
    }

    @RequestMapping(value = "/{pId}/edit", method = RequestMethod.POST)
    @ResponseBody
    public Result updateProductInfo(@PathVariable("pId")int pId,
            @SessionAttribute("userId")int userId,
                                    Product product,
                                    @RequestParam(value = "addImages", required = false)MultipartFile files[],
                                    @RequestParam(value = "deleteImages", required = false)int deleteIds[]) {
        //save product get productId
        product.setUserId(userId);
        product.setProductId(pId);
        Result<Product> productResult = productService.updateProduct(product);
        if (productResult.getStatus() == 200) {
            // save img
            Optional.ofNullable(files).ifPresent(addF -> {
                productService.insertProductImage(getImgs(FileUtil.saveMultiImgs(files), pId));
            });
            Optional.ofNullable(deleteIds).ifPresent(deleteids -> {
                productService.deleteProductImage(deleteids);
            });
            //跳转到详情页面
            return Result.build(200, "更改成功");
        } else {
            return Result.build(200, "更改失败");
        }
    }

    /**
     * 可以处理登录后的请求以及登陆之前的请求
     */
    @PostMapping("/list")
    @ResponseBody
    public Result<PageInfo> productList(@SessionAttribute(value = StatusUtil.USERIDKEY, required = false)Integer userId,
            @RequestParam(value = "userId", required = false)Integer userId2,
            @RequestParam(value = "orderBy", required = false)String orderBy,
            @RequestParam(value = "method", required = false)Integer sortMethod,
            @RequestParam(value = "page",required = false)Integer page) {
        if (userId == null && userId2 == null) {
            return Result.build(400, "错误请求");
        } else if (userId == null) {
            userId = userId2;
        }

        if (page == null || page <= 0) {
            page = 1;
        }
        Result<List<Product>> productRes;
        if (orderBy != null && sortMethod != null) {
            switch (orderBy) {
                case "price" :
                    PageHelper.startPage(page,PAGESIZE);
                    productRes = productService.selectProductByUserId(userId, "price", sortMethod==1);
                    break;
                case "date" :
                    PageHelper.startPage(page,PAGESIZE);
                    productRes = productService.selectProductByUserId(userId, "up_time", sortMethod==1);
                    break;
                    default:
                        return Result.build(400, "错误参数");
            }
        }else {
            PageHelper.startPage(page,PAGESIZE);
            productRes = productService.selectProductByUserId(userId);
        }

        PageInfo pageInfo = new PageInfo(productRes.getData());
        return Result.build(productRes.getStatus(), productRes.getMsg(), pageInfo);
    }
    /**
     * 可以处理登录后的请求以及登陆之前的请求
     */
    @PostMapping("/list/favor")
    @ResponseBody
    public Result<PageInfo> favorProduceList(@SessionAttribute(value = StatusUtil.USERIDKEY, required = false)Integer userId,
            @RequestParam(value = "orderBy", required = false)String orderBy,
            @RequestParam(value = "method", required = false)Integer sortMethod,
            @RequestParam(value = "page",required = false)Integer page) {
        if (page == null || page <= 0) {
            page = 1;
        }
        Result<List<Product>> productRes;
        if (orderBy != null && sortMethod != null) {
            switch (orderBy) {
                case "date" :
                    PageHelper.startPage(page,PAGESIZE);
                    productRes = productService.selectFavorProductByUserId(userId, "time", sortMethod==1);
                    break;
                    default:
                        return Result.build(400, "错误参数");
            }
        }else {
            PageHelper.startPage(page,PAGESIZE);
            productRes = productService.selectFavorProductByUserId(userId, "time", true);
        }

        PageInfo pageInfo = new PageInfo(productRes.getData());
        return Result.build(productRes.getStatus(), productRes.getMsg(), pageInfo);
    }


    @PostMapping("/{pId}/past")
    @ResponseBody
    public Result pastProduct(@PathVariable("pId")int pId) {
        return productService.pastProduct(pId);
    }

    @GetMapping("/{pId}/favor")
    @ResponseBody
    public Result favorProduct(@PathVariable("pId") int pId, @SessionAttribute(StatusUtil.USERIDKEY) int userId) {
        productService.updateFavorTimes(pId);
        return favorProductService.insertFavorProduct(userId, pId);
    }
    @GetMapping("/{pId}/disFavor")
    @ResponseBody
    public Result disFavorProduct(@PathVariable("pId") int pId, @SessionAttribute(StatusUtil.USERIDKEY) int userId) {
        return favorProductService.deleteFavorProduct(userId, pId);
    }


    private List<ProductImage> getImgs(Result<List<String>> imgs ,int proId) {
        if (imgs.getStatus() == 200) {
            List<ProductImage> imags = new ArrayList<>();
            List<String> paths = imgs.getData();
            paths.forEach(path -> {
                ProductImage image = new ProductImage();
                image.setProductId(proId);
                image.setUrl(path);
                imags.add(image);
            });
            return imags;
        }
        return null;
    }

}
