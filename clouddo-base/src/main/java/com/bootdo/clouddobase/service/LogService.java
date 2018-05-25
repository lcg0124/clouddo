package com.bootdo.clouddobase.service;


import com.bootdo.clouddocommon.dto.LogDO;
import com.bootdo.clouddocommon.utils.Query;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public interface LogService {
    int save(LogDO logDO);

    List<LogDO> queryList(Query query);

    int count(Query query);

    int remove(Long id);

    int batchRemove(Long[] ids);
}
