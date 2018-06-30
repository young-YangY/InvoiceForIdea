/**
 * 
 */
package com.invoicing.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

/**
 * @author yuyang
 * 2017年10月9日
 */
public class SetCharacterEncodingFilter implements Filter{
	 protected String encoding = null;  
	    protected FilterConfig filterConfig = null;  
	    public void destroy() {}  
	    public void init(FilterConfig filterConfig) throws ServletException {  
	        this.filterConfig = filterConfig;  
	        this.encoding = filterConfig.getInitParameter("encoding");  
	    }  
	    /** 
	     * Select and set(if specified) the character encoding to be used to 
	     * interpret request parameters for this request 
	     */  
	    public void doFilter(ServletRequest request,ServletResponse response,  
	                          FilterChain chain) throws IOException,ServletException {  
	        request.setCharacterEncoding(encoding);  
	        response.setCharacterEncoding(encoding);
	        chain.doFilter(request,response);  
	    } 
}
