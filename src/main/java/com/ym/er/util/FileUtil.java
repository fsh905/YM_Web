package com.ym.er.util;

import com.ym.er.model.Result;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

/**
 * Created by YM on 3/11/2017.
 * 文件存储类
 */
public class FileUtil {

    public static Result<String> saveSingleImg(MultipartFile file) {
        String res = saveImg(file);
        return res != null ? Result.build(200, "保存成功", res) : Result.build(400, "保存失败");
    }

    public static String saveImg(MultipartFile file) {
        String fileType = file.getContentType();
        String fileFormat = fileType.substring(fileType.lastIndexOf("/")+1);
        String vPath = "/images/stu/header/"+ IDUtils.genImageName()+"."+fileFormat;
        StringBuilder path = new StringBuilder("E:" + vPath);
        try {
            File newImg = new File(path.toString());
            if (!newImg.exists()) {
                newImg.createNewFile();
            }
            file.transferTo(newImg);
        } catch (IllegalStateException | IOException e) {
            e.printStackTrace();
            return null;
        }
        return vPath;
    }

    public static Result<List<String>> saveMultiImgs(MultipartFile files[]) {
        List<String> paths = new ArrayList<>();
        for (MultipartFile file : files) {
            Optional.ofNullable(saveImg(file)).ifPresent(path -> paths.add(path));
        }
        if (paths.size() == 0) {
            return Result.build(400, "保存失败");
        }
        return  Result.build(200, "保存成功", paths);
    }

}
