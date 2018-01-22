package com.bootdo.clouddocommon.intercepter;

import com.bootdo.clouddocommon.Constants.CommonConstants;
import com.bootdo.clouddocommon.context.FilterContextHandler;
import feign.RequestInterceptor;
import feign.RequestTemplate;

public class FeignIntercepter implements RequestInterceptor {

    @Override
    public void apply(RequestTemplate requestTemplate) {
        String f = FilterContextHandler.getToken();
        requestTemplate.header(CommonConstants.CONTEXT_TOKEN, FilterContextHandler.getToken());
    }
}