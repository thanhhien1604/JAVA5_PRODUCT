package org.example.demobuoi1.security;
import jakarta.servlet.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

public class AuthorFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        Filter.super.init(filterConfig);
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest httpServletRequest = (HttpServletRequest) servletRequest;
        HttpServletResponse httpServletResponse = (HttpServletResponse) servletResponse;
        HttpSession session = httpServletRequest.getSession(false);
        String quyen = (session!=null)?(String) session.getAttribute("quyen"):null;
        String requestURI = httpServletRequest.getRequestURI();
        if(requestURI.startsWith("/error")){
            filterChain.doFilter(httpServletRequest, httpServletResponse);
            return;
        }
        if(requestURI.startsWith("/login")){
            filterChain.doFilter(httpServletRequest, httpServletResponse);
            return;
        }
        if(quyen == null){
            httpServletResponse.sendRedirect(httpServletRequest.getContextPath() + "/error");
            return;
        }
        if(requestURI.startsWith("/hoa-don/index") && (quyen == null || !quyen.equals("Admin"))){
            httpServletResponse.sendRedirect(httpServletRequest.getContextPath() + "/error");
            return;
        }
        if(requestURI.startsWith("/hoa-don-chi-tiet/index") && (quyen == null || !quyen.equals("Admin"))){
            httpServletResponse.sendRedirect(httpServletRequest.getContextPath() + "/error");
            return;
        }
        filterChain.doFilter(httpServletRequest, httpServletResponse);

    }

    @Override
    public void destroy() {
        Filter.super.destroy();
    }
}
