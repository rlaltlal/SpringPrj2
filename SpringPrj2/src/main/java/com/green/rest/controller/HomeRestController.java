package com.green.rest.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.io.StringReader;
import java.io.StringWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.security.KeyManagementException;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.security.cert.CertificateException;
import java.security.cert.X509Certificate;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLContext;
import javax.net.ssl.TrustManager;
import javax.net.ssl.X509TrustManager;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;

import com.green.board.vo.BoardPager;
import com.green.imageboard.service.imageBoardService;
import com.green.imageboard.vo.BoardVo;
import com.green.user.service.UserService;
import com.green.user.vo.TrainInformVo;
import com.green.user.vo.UserVo;

//package - com.green.user : user controller
//          com.green.rest : board controller
 
// @RestController : @Controller와 @ResponseBody의 혼합
@RestController
@RequestMapping("/RestBoard")
public class HomeRestController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private imageBoardService imageboardService;
	// link: /RestBoard/train
	@RequestMapping(value="/train",method=RequestMethod.POST, 
			headers="Accept=application/json" )
	public void train(HttpServletRequest request, HttpServletResponse response) throws IOException, NoSuchAlgorithmException, KeyManagementException {
		request.setCharacterEncoding("UTF-8");
		String pageNo=request.getParameter("pageNo")         ;
		if(pageNo==null) pageNo="1";
		String numOfRows=request.getParameter("numOfRows")   ;
		if(numOfRows==null) numOfRows="10";
		String _type=request.getParameter("_type")   ;
		if(_type==null) _type="xml";
		String depPlaceId=request.getParameter("depPlaceId")             ;
		if(depPlaceId==null) depPlaceId="NAT010000";
		String arrPlaceId=request.getParameter("arrPlaceId")         ;
		if(arrPlaceId==null) arrPlaceId="NAT011668";
		String depPlandTime=request.getParameter("depPlandTime")         ;
		if(depPlandTime==null) depPlandTime="20211201";
		String trainGradeCode=request.getParameter("trainGradeCode")         ;
		if(trainGradeCode==null) trainGradeCode="00";
		String serviceKey="tvfqSK3YoFSu5zUxFlRXzHPZy9sScorrRktSoMvbTcl7tUkGqTkXWdF%2Ft2HrV6I7jwwLl2ugEEob0gMnq%2BTXBw%3D%3D";
		String dataurl="https://apis.data.go.kr/1613000/TrainInfoService/getStrtpntAlocFndTrainInfo";
		
		//호출
		StringBuilder sb=new StringBuilder(dataurl);
		sb.append("?"+URLEncoder.encode("serviceKey","UTF-8")+"="+serviceKey);
		//문자열 encoding 설정. serviceKey는 encoding된 키를 가져왔으므로 필요없음
		sb.append("&"+URLEncoder.encode("pageNo","UTF-8")+"="+URLEncoder.encode(pageNo,"UTF-8"));
		sb.append("&"+URLEncoder.encode("numOfRows","UTF-8")+"="+URLEncoder.encode(numOfRows,"UTF-8"));
		sb.append("&"+URLEncoder.encode("_type","UTF-8")+"="+URLEncoder.encode(_type,"UTF-8"));
		sb.append("&"+URLEncoder.encode("depPlaceId","UTF-8")+"="+URLEncoder.encode(depPlaceId,"UTF-8"));
		sb.append("&"+URLEncoder.encode("arrPlaceId","UTF-8")+"="+URLEncoder.encode(arrPlaceId,"UTF-8"));
		sb.append("&"+URLEncoder.encode("depPlandTime","UTF-8")+"="+URLEncoder.encode(depPlandTime,"UTF-8"));
		sb.append("&"+URLEncoder.encode("trainGradeCode","UTF-8")+"="+URLEncoder.encode(trainGradeCode,"UTF-8"));
		URL url=new URL(sb.toString());
		
		TrustManager[] trustAllCerts = new TrustManager[] 
				{ (TrustManager) new X509TrustManager() {		
					public X509Certificate[] getAcceptedIssuers1() {			
						return null;		
						}		
					@Override
					public void checkClientTrusted(X509Certificate[] chain, String authType)
							throws CertificateException {
						// TODO Auto-generated method stub
						
					}
					@Override
					public void checkServerTrusted(X509Certificate[] chain, String authType)
							throws CertificateException {
						// TODO Auto-generated method stub
						
					}
					@Override
					public X509Certificate[] getAcceptedIssuers() {
						// TODO Auto-generated method stub
						return null;
					}
					}
				};
		
		SSLContext sc = SSLContext.getInstance("SSL");	
		sc.init(null, trustAllCerts, new SecureRandom());	
		HttpsURLConnection.setDefaultSSLSocketFactory(sc.getSocketFactory());
		HttpsURLConnection conn=(HttpsURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Content-type", "application/xml");
		
		
		//도착한 데이터 처리
		BufferedReader br;
		if(conn.getResponseCode()>=200 && conn.getResponseCode()<=300) {
			br=new BufferedReader(new InputStreamReader(conn.getInputStream()));
		}else {
			br=new BufferedReader(new InputStreamReader(conn.getErrorStream()));
		}
		
		
		
		//data -> 문자열
		sb=new StringBuilder();
		String line;
		while((line=br.readLine())!=null) {
			sb.append(line);
		}
		br.close();
		conn.disconnect();
		String xml=sb.toString();
		//기차가격이 0인 데이터 파싱 -> 임의 값으로 변경
		try {
			DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
			DocumentBuilder documentBuilder = factory.newDocumentBuilder();
			InputSource is = new InputSource();
			is.setCharacterStream(new StringReader(xml));
			Document doc=documentBuilder.parse(is);
			doc.getDocumentElement().normalize();
			NodeList items=doc.getElementsByTagName("item");
			int n=items.getLength();
			String temp="";
			for(int i=0;i<n;i++) {
				Node node=items.item(i);
				Element eElement=(Element)node;
				NodeList nllist=eElement.getElementsByTagName("adultcharge").item(0).getChildNodes();
				String adultcharge=nllist.item(0).getTextContent(); 
				if(!adultcharge.equals("0")) {
					temp=adultcharge;
					break;
				}
			}
			for(int i=0;i<n;i++) {
				Node node=items.item(i);
				Element eElement=(Element)node;
				NodeList nllist=eElement.getElementsByTagName("adultcharge").item(0).getChildNodes();
				String adultcharge=nllist.item(0).getTextContent(); 
				if(adultcharge.equals("0")) {
					nllist.item(0).setTextContent(temp);
				}
			}
			response.setContentType("application/xml;charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.print(toString(doc));
			out.flush();
		} catch (ParserConfigurationException | SAXException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		// map없이 List를 바로 전달
		// json 형식 [{"key":"value", ...},{...}]
	}
	
	// link: /RestBoard/Cities
	@RequestMapping(value="/Cities",method=RequestMethod.POST, 
			headers="Accept=application/json" )
	public void cities(HttpServletRequest request, HttpServletResponse response) throws IOException, NoSuchAlgorithmException, KeyManagementException {
		request.setCharacterEncoding("UTF-8");
		String _type=request.getParameter("_type")   ;
		if(_type==null) _type="xml";
		String serviceKey="tvfqSK3YoFSu5zUxFlRXzHPZy9sScorrRktSoMvbTcl7tUkGqTkXWdF%2Ft2HrV6I7jwwLl2ugEEob0gMnq%2BTXBw%3D%3D";
		String dataurl="https://apis.data.go.kr/1613000/TrainInfoService/getCtyCodeList";
		
		//호출
		StringBuilder sb=new StringBuilder(dataurl);
		sb.append("?"+URLEncoder.encode("serviceKey","UTF-8")+"="+serviceKey);
		//문자열 encoding 설정. serviceKey는 encoding된 키를 가져왔으므로 필요없음
		sb.append("&"+URLEncoder.encode("_type","UTF-8")+"="+URLEncoder.encode(_type,"UTF-8"));
		URL url=new URL(sb.toString());
		
		TrustManager[] trustAllCerts = new TrustManager[] 
				{ (TrustManager) new X509TrustManager() {		
					public X509Certificate[] getAcceptedIssuers1() {			
						return null;		
					}		
					@Override
					public void checkClientTrusted(X509Certificate[] chain, String authType)
							throws CertificateException {
						// TODO Auto-generated method stub
						
					}
					@Override
					public void checkServerTrusted(X509Certificate[] chain, String authType)
							throws CertificateException {
						// TODO Auto-generated method stub
						
					}
					@Override
					public X509Certificate[] getAcceptedIssuers() {
						// TODO Auto-generated method stub
						return null;
					}
				}
				};
		
		SSLContext sc = SSLContext.getInstance("SSL");	
		sc.init(null, trustAllCerts, new SecureRandom());	
		HttpsURLConnection.setDefaultSSLSocketFactory(sc.getSocketFactory());
		HttpsURLConnection conn=(HttpsURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Content-type", "application/xml");
		
		//도착한 데이터 처리
		BufferedReader br;
		if(conn.getResponseCode()>=200 && conn.getResponseCode()<=300) {
			br=new BufferedReader(new InputStreamReader(conn.getInputStream()));
		}else {
			br=new BufferedReader(new InputStreamReader(conn.getErrorStream()));
		}
		
		//data -> 문자열
		sb=new StringBuilder();
		String line;
		while((line=br.readLine())!=null) {
			sb.append(line);
		}
		br.close();
		conn.disconnect();
		String xml=sb.toString();
		//res
		response.setContentType("application/xml;charset=UTF-8");
		PrintWriter out=response.getWriter();
		out.print(xml);
		out.flush();
		// map없이 List를 바로 전달
		// json 형식 [{"key":"value", ...},{...}]
	}
	
	// link: /RestBoard/Traintype
	@RequestMapping(value="/Traintype",method=RequestMethod.POST, 
			headers="Accept=application/json" )
	public void traintype(HttpServletRequest request, HttpServletResponse response) throws IOException, NoSuchAlgorithmException, KeyManagementException {
		request.setCharacterEncoding("UTF-8");
		String _type=request.getParameter("_type")   ;
		if(_type==null) _type="xml";
		String serviceKey="tvfqSK3YoFSu5zUxFlRXzHPZy9sScorrRktSoMvbTcl7tUkGqTkXWdF%2Ft2HrV6I7jwwLl2ugEEob0gMnq%2BTXBw%3D%3D";
		String dataurl="https://apis.data.go.kr/1613000/TrainInfoService/getVhcleKndList";
		
		//호출
		StringBuilder sb=new StringBuilder(dataurl);
		sb.append("?"+URLEncoder.encode("serviceKey","UTF-8")+"="+serviceKey);
		//문자열 encoding 설정. serviceKey는 encoding된 키를 가져왔으므로 필요없음
		sb.append("&"+URLEncoder.encode("_type","UTF-8")+"="+URLEncoder.encode(_type,"UTF-8"));
		URL url=new URL(sb.toString());
		
		TrustManager[] trustAllCerts = new TrustManager[] 
				{ (TrustManager) new X509TrustManager() {		
					public X509Certificate[] getAcceptedIssuers1() {			
						return null;		
					}		
					@Override
					public void checkClientTrusted(X509Certificate[] chain, String authType)
							throws CertificateException {
						// TODO Auto-generated method stub
						
					}
					@Override
					public void checkServerTrusted(X509Certificate[] chain, String authType)
							throws CertificateException {
						// TODO Auto-generated method stub
						
					}
					@Override
					public X509Certificate[] getAcceptedIssuers() {
						// TODO Auto-generated method stub
						return null;
					}
				}
				};
		
		SSLContext sc = SSLContext.getInstance("SSL");	
		sc.init(null, trustAllCerts, new SecureRandom());	
		HttpsURLConnection.setDefaultSSLSocketFactory(sc.getSocketFactory());
		HttpsURLConnection conn=(HttpsURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Content-type", "application/xml");
		
		//도착한 데이터 처리
		BufferedReader br;
		if(conn.getResponseCode()>=200 && conn.getResponseCode()<=300) {
			br=new BufferedReader(new InputStreamReader(conn.getInputStream()));
		}else {
			br=new BufferedReader(new InputStreamReader(conn.getErrorStream()));
		}
		
		//data -> 문자열
		sb=new StringBuilder();
		String line;
		while((line=br.readLine())!=null) {
			sb.append(line);
		}
		br.close();
		conn.disconnect();
		String xml=sb.toString();
		//res
		response.setContentType("application/xml;charset=UTF-8");
		PrintWriter out=response.getWriter();
		out.print(xml);
		out.flush();
		// map없이 List를 바로 전달
		// json 형식 [{"key":"value", ...},{...}]
	}
	
	// link: /RestBoard/Trainstation
	@RequestMapping(value="/Trainstation",method=RequestMethod.POST, 
			headers="Accept=application/json" )
	public void trainstation(HttpServletRequest request, HttpServletResponse response) throws IOException, NoSuchAlgorithmException, KeyManagementException {
		request.setCharacterEncoding("UTF-8");
		String pageNo=request.getParameter("pageNo")   ;
		if(pageNo==null) pageNo="1";
		String numOfRows=request.getParameter("numOfRows")   ;
		if(numOfRows==null) numOfRows="10";
		String _type=request.getParameter("_type")   ;
		if(_type==null) _type="xml";
		String cityCode=request.getParameter("cityCode")   ;
		if(cityCode==null) cityCode="11";
		String serviceKey="tvfqSK3YoFSu5zUxFlRXzHPZy9sScorrRktSoMvbTcl7tUkGqTkXWdF%2Ft2HrV6I7jwwLl2ugEEob0gMnq%2BTXBw%3D%3D";
		String dataurl="https://apis.data.go.kr/1613000/TrainInfoService/getCtyAcctoTrainSttnList";
		
		//호출
		StringBuilder sb=new StringBuilder(dataurl);
		sb.append("?"+URLEncoder.encode("serviceKey","UTF-8")+"="+serviceKey);
		//문자열 encoding 설정. serviceKey는 encoding된 키를 가져왔으므로 필요없음
		sb.append("&"+URLEncoder.encode("pageNo","UTF-8")+"="+URLEncoder.encode(pageNo,"UTF-8"));
		sb.append("&"+URLEncoder.encode("numOfRows","UTF-8")+"="+URLEncoder.encode(numOfRows,"UTF-8"));
		sb.append("&"+URLEncoder.encode("_type","UTF-8")+"="+URLEncoder.encode(_type,"UTF-8"));
		sb.append("&"+URLEncoder.encode("cityCode","UTF-8")+"="+URLEncoder.encode(cityCode,"UTF-8"));
		URL url=new URL(sb.toString());
		
		TrustManager[] trustAllCerts = new TrustManager[] 
				{ (TrustManager) new X509TrustManager() {		
					public X509Certificate[] getAcceptedIssuers1() {			
						return null;		
					}		
					@Override
					public void checkClientTrusted(X509Certificate[] chain, String authType)
							throws CertificateException {
						// TODO Auto-generated method stub
						
					}
					@Override
					public void checkServerTrusted(X509Certificate[] chain, String authType)
							throws CertificateException {
						// TODO Auto-generated method stub
						
					}
					@Override
					public X509Certificate[] getAcceptedIssuers() {
						// TODO Auto-generated method stub
						return null;
					}
				}
				};
		
		SSLContext sc = SSLContext.getInstance("SSL");	
		sc.init(null, trustAllCerts, new SecureRandom());	
		HttpsURLConnection.setDefaultSSLSocketFactory(sc.getSocketFactory());
		HttpsURLConnection conn=(HttpsURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Content-type", "application/xml");
		
		//도착한 데이터 처리
		BufferedReader br;
		if(conn.getResponseCode()>=200 && conn.getResponseCode()<=300) {
			br=new BufferedReader(new InputStreamReader(conn.getInputStream()));
		}else {
			br=new BufferedReader(new InputStreamReader(conn.getErrorStream()));
		}
		
		//data -> 문자열
		sb=new StringBuilder();
		String line;
		while((line=br.readLine())!=null) {
			sb.append(line);
		}
		br.close();
		conn.disconnect();
		String xml=sb.toString();
		//res
		response.setContentType("application/xml;charset=UTF-8");
		PrintWriter out=response.getWriter();
		out.print(xml);
		out.flush();
		// map없이 List를 바로 전달
		// json 형식 [{"key":"value", ...},{...}]
	}
	// link: /RestBoard/accom
	@RequestMapping(value="/accom",method=RequestMethod.POST, 
			headers="Accept=application/json" )
	public void list(HttpServletRequest request, HttpServletResponse response) throws IOException, NoSuchAlgorithmException, KeyManagementException {
		request.setCharacterEncoding("UTF-8");
		String listYN=request.getParameter("listYN")         ;
		if(listYN==null) listYN="Y";
		String numOfRows=request.getParameter("numOfRows")   ;
		if(numOfRows==null) numOfRows="10";
		String pageNo=request.getParameter("pageNo")   ;
		if(pageNo==null) pageNo="1";
		String MobileOS=request.getParameter("MobileOS")             ;
		if(MobileOS==null) MobileOS="ETC";
		String MobileApp=request.getParameter("MobileApp")         ;
		if(MobileApp==null) MobileApp="TourAPI3.0_Guide";
		String arrange=request.getParameter("arrange")         ;
		if(arrange==null) arrange="A";
		String areaCode=request.getParameter("areaCode")         ;
		if(areaCode==null) areaCode="1";
		String serviceKey="tvfqSK3YoFSu5zUxFlRXzHPZy9sScorrRktSoMvbTcl7tUkGqTkXWdF%2Ft2HrV6I7jwwLl2ugEEob0gMnq%2BTXBw%3D%3D";
		String dataurl="http://api.visitkorea.or.kr/openapi/service/rest/KorService/searchStay";
		
		//호출
		StringBuilder sb=new StringBuilder(dataurl);
		sb.append("?"+URLEncoder.encode("serviceKey","UTF-8")+"="+serviceKey);
		//문자열 encoding 설정. serviceKey는 encoding된 키를 가져왔으므로 필요없음
		sb.append("&"+URLEncoder.encode("numOfRows","UTF-8")+"="+URLEncoder.encode(numOfRows,"UTF-8"));
		sb.append("&"+URLEncoder.encode("pageNo","UTF-8")+"="+URLEncoder.encode(pageNo,"UTF-8"));
		sb.append("&"+URLEncoder.encode("MobileOS","UTF-8")+"="+URLEncoder.encode(MobileOS,"UTF-8"));
		sb.append("&"+URLEncoder.encode("MobileApp","UTF-8")+"="+URLEncoder.encode(MobileApp,"UTF-8"));
		sb.append("&"+URLEncoder.encode("arrange","UTF-8")+"="+URLEncoder.encode(arrange,"UTF-8"));
		sb.append("&"+URLEncoder.encode("listYN","UTF-8")+"="+URLEncoder.encode(listYN,"UTF-8"));
		sb.append("&"+URLEncoder.encode("areaCode","UTF-8")+"="+URLEncoder.encode(areaCode,"UTF-8"));
		URL url=new URL(sb.toString());
		HttpURLConnection conn=(HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Content-type", "application/xml");
		
		//도착한 데이터 처리
		BufferedReader br;
		if(conn.getResponseCode()>=200 && conn.getResponseCode()<=300) {
			br=new BufferedReader(new InputStreamReader(conn.getInputStream()));
		}else {
			br=new BufferedReader(new InputStreamReader(conn.getErrorStream()));
		}
		
		//data -> 문자열
		sb=new StringBuilder();
		String line;
		while((line=br.readLine())!=null) {
			sb.append(line);
		}
		br.close();
		conn.disconnect();
		String xml=sb.toString();
		//res
		response.setContentType("application/xml;charset=UTF-8");
		PrintWriter out=response.getWriter();
		out.print(xml);
		out.flush();
		// map없이 List를 바로 전달
		// json 형식 [{"key":"value", ...},{...}]
	}
	
	// link: /Board/{id}
	@RequestMapping(value="/{id}", method=RequestMethod.GET,
			headers="Accept=application/json")
	public UserVo getUserById(@PathVariable String id) {
		UserVo vo=null;
		vo=userService.getView(id);
		return vo;
	}
	@RequestMapping(value="/traininform", method=RequestMethod.POST,
			headers="Accept=application/json")
	public List<TrainInformVo> traininform(@RequestParam HashMap<String,Object> map) {		
		System.out.println(map);
		String date=(String)map.get("depPlandTime");
		String newString = date.substring(0, 3) + '2'+ date.substring(3 + 1);
		map.put("depPlandTime", newString);
		List<TrainInformVo> list=null;
		list=userService.getTrainInform(map);
		return list;
	}
	
	// link: /Board/{id}
		@RequestMapping(value="/BoardRecomm", method=RequestMethod.POST,
				headers="Accept=application/json")
		public com.green.imageboard.vo.BoardVo boardrecomm(@RequestParam HashMap<String,Object> map) {
			System.out.println("추천 글 번호"+map);
			com.green.imageboard.vo.BoardVo vo=new BoardVo();
			System.out.println("here is restcontroller");
			vo=imageboardService.updateRecomm(map); // update 기능후 그 글의 추천수 가져와야함
			return vo;
		}
		
	// link: /Board, method=post
//	@RequestMapping(method=RequestMethod.POST,
//			headers="Accept=application/json")
//	public List<UserVo> getUserByName(String name) {
//		List<UserVo> list=null;
//		list=userService.getViewName(name);
//		return list;
//	}
	
	// link: /Board/name/{name}
	@RequestMapping(value="/name/{name}",
			method=RequestMethod.GET,
			headers="Accept=application/json")
	public List<UserVo> getUserByName2(@PathVariable String name){
		List<UserVo> list=userService.getViewName(name);
		return list;
	}
	public static String toString(Document doc) {
	    try {
	        StringWriter sw = new StringWriter();
	        TransformerFactory tf = TransformerFactory.newInstance();
	        Transformer transformer = tf.newTransformer();
	        transformer.setOutputProperty(OutputKeys.OMIT_XML_DECLARATION, "no");
	        transformer.setOutputProperty(OutputKeys.METHOD, "xml");
	        transformer.setOutputProperty(OutputKeys.INDENT, "yes");
	        transformer.setOutputProperty(OutputKeys.ENCODING, "UTF-8");

	        transformer.transform(new DOMSource(doc), new StreamResult(sw));
	        return sw.toString();
	    } catch (Exception ex) {
	        throw new RuntimeException("Error converting to String", ex);
	    }
	}
	 
}
