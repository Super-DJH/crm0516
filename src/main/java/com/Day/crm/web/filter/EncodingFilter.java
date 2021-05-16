package com.Day.crm.web.filter;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

public class EncodingFilter implements Filter {
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {

        servletRequest.setCharacterEncoding("UTF-8");
        servletResponse.setContentType("text/html;charset=utf-8");

        //HttpServletRequest request =(HttpServletRequest) servletRequest;
        //    "/crm/settings/user/login.do"
        //System.out.println("ZZZZZZZZZZZZZZZZZZZZZZZZZZZ"+request.getRequestURI());


        filterChain.doFilter(servletRequest,servletResponse);
    }
}
