package com.bootdo.clouddocms.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import com.bootdo.clouddocms.domain.FileDO;
import com.bootdo.clouddocms.dto.FileDTO;
import com.bootdo.clouddocms.dto.convert.FileConvert;
import com.bootdo.clouddocms.service.FileService;
import com.bootdo.clouddocommon.utils.PageUtils;
import com.bootdo.clouddocommon.utils.Query;
import com.bootdo.clouddocommon.utils.R;

/**
 * 文件上传
 *
 * @author chglee
 * @email 1992lcg@163.com
 * @date 2018-03-12 12:17:36
 */

@RestController
@RequestMapping("/clouddocms/file")
public class FileController {

    @Autowired
    private FileService fileService;

    @GetMapping("{id}")
    public R get(@PathVariable Long id){
        FileDTO fileDTO = FileConvert.MAPPER.do2dto(fileService.get(id));
        return R.data(fileDTO);
    }
    /**
    * 分页查询
    */
    @GetMapping
    public R list(@RequestParam Map<String, Object> params) {
        Query query = new Query(params);
        List<FileDO> fileList = fileService.list(query);
        List<FileDTO> fileDTOS = FileConvert.MAPPER.dos2dtos(fileList);
        int total = fileService.count(query);
        PageUtils pageUtils = new PageUtils(fileDTOS, total);
        return R.page(pageUtils);
    }

    /**
     * 保存
     */
    @PostMapping
    public R save(FileDO file) {
        return R.operate(fileService.save(file) > 0);
    }

    /**
     * 修改
     */
    @PutMapping
    public R update(FileDO file) {
        return R.operate(fileService.update(file) >0 );
    }

    /**
     * 删除
     */
    @DeleteMapping
    public R remove( Long id) {
        return R.operate(fileService.remove(id) > 0);
    }

    /**
     * 删除
     */
    @DeleteMapping ("/batchRemove")
    public R remove(@RequestParam("ids[]") Long[]ids) {
        return R.operate(fileService.batchRemove(ids)>0);
    }
}
