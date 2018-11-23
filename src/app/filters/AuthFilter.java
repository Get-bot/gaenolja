package app.filters;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.context.request.WebRequest;



public class AuthFilter extends HttpFilter{
	
		public void init(FilterConfig filterConfig) throws ServletException {
			System.out.println("[TestFilter]init");
		
		}		
		
		protected void doFilter(HttpServletRequest request, HttpServletResponse response, FilterChain chain)
				throws IOException, ServletException {
			HttpSession session = request.getSession();
			String query = request.getQueryString();
			String originUri = request.getRequestURI();
			String uri = request.getRequestURI()+(query!=null ? "?"+query : "");
			System.out.println(query);
			request.getSession().setAttribute("current",uri);		
		
			System.out.println("doFilter entered");
			
			
			if (session.getAttribute("userInfo")!=null) {
				chain.doFilter(request, response);
				//response.sendRedirect(uri);
				System.out.println("userInfo not null");
			} else {
				System.out.println("userInfo null");
				System.out.println(originUri.substring(request.getContextPath().length()));
				String temp = "";

				
					switch(originUri.substring(request.getContextPath().length())) {
					default : 
						response.sendRedirect(request.getContextPath()+"/main/login.do");
						break;
					case "/main/index.do":
					case "/Nboard/list.do":
					case "/dogTalk/index.do":
					case "/board/main.do":
					case "/board/delete.do":
					case "/board/add.do":
					case "/find/list.do":
					case "/parcel.do":
					case "/together/mainboard.do":
					case "/dogTraining/training.do":
					case "/help/list.do":
					case "/doghospital.do":
					case "/main/login.do":
					case "/main/terms.do":
					case "/main/findId.do":
					case "/main/findPassWord.do":
					case "/main/getUserPassword.do":
					case "/main/getUserProfile.do":
					case "/main/joinform.do":
					case "/main/logout.do":
					case "/main/validate.do":		
					case "/access.do":
					case "/dogTalk/add.do":
					case "/":
					case "/joinform.do":
					case "/validate.do":
						chain.doFilter(request, response);
						break;
					}
				
				
		
			}
		}	
	
		public void destroy() {
			System.out.println("[TestFilter] destroy");
		}
	}
