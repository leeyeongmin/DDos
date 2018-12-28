package com.ddos.web.book.impl;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.imageio.ImageIO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;
import org.xmlpull.v1.XmlPullParserFactory;

import com.ddos.web.book.BookService;
import com.ddos.web.book.BookVO;

@Service
public class BookServiceImpl implements BookService {
	String clientId = "A72f6xcrh9D_cHXQfdMY";
    String clientSecret = "sjiXcLA2Ln";

	@Autowired
	BookDAOMybatis dab;

	// 전체 조회
	
	  @Override public List<BookVO> getBookList(BookVO vo) { return
	  dab.getBookList(vo); }
	 

	// 한건 조회
	@Override
	public BookVO getBook(BookVO vo) {
		return dab.getBook(vo);

	}

	// 갯수
	@Override
	public int getCount(BookVO vo) {
		return dab.getCount(vo);
	}

// admin
	// 전체 조회

	@Override
	public List<BookVO> adminGetBookList(BookVO vo) {
		return dab.adminGetBookList(vo);
	}

	// 건수
	@Override
	public BookVO adminGetBook(BookVO vo) {
		return dab.adminGetBook(vo);
	}

	// 입력
	@Override
	public void adminInsertBook(BookVO vo) {
		dab.adminInsertBook(vo);

	}

	// 수정
	@Override
	public void adminUpdateBook(BookVO vo) {
		dab.adminUpdateBook(vo);
	}

	@Override
	public List<BookVO> apiBookList(String isbn, int display, int start) {
		
		 List<BookVO> list = null;
	        try {
	            URL url;
	            url = new URL("https://openapi.naver.com/v1/search/"
	                    + "book.xml?query="
	                    + URLEncoder.encode(isbn, "UTF-8")
	                    + (display !=0 ? "&display=" +display :"")
	                    + (start !=0 ? "&start=" +start :""));
	 
	            URLConnection urlConn = url.openConnection();
	            urlConn.setRequestProperty("X-Naver-Client-Id", clientId);
	            urlConn.setRequestProperty("X-Naver-Client-Secret", clientSecret);
	            
	            XmlPullParserFactory factory = XmlPullParserFactory.newInstance();
	            XmlPullParser parser = factory.newPullParser();
	            parser.setInput(
	                    new InputStreamReader(urlConn.getInputStream()));
	            //Test에서 했던 방식은 DOM방식이기때문에? 
	            //그래서 이렇게 해도 된다?!??!??!? 
	            
	            
	            
	            int eventType = parser.getEventType();
	            BookVO b = null;
	            while (eventType != XmlPullParser.END_DOCUMENT) {
	            	
	                switch (eventType) {
	                case XmlPullParser.END_DOCUMENT: // 문서의 끝
	                    break;
	                case XmlPullParser.START_DOCUMENT:
	                    list = new ArrayList<BookVO>();
	                    break;
	                case XmlPullParser.END_TAG: {
	                    String tag = parser.getName();
	                    if(tag.equals("item"))
	                    {
	                        list.add(b);
	                        b = null;
	                    }
	                }
	                case XmlPullParser.START_TAG: {
	                    String tag = parser.getName();
	                    switch (tag) {
	                    case "item":
	                        b = new BookVO();
	                        break;
	                    case "title":
	                        if(b != null)
	                            b.setBookTitle(parser.nextText());
	                        break;
	                   
	                    case "image":
	                        if(b != null) {	                            
	                            String img = parser.nextText();
	                            File outputFile = new File("C:\\Users\\User\\git\\DDos\\DDosProject\\src\\main\\webapp\\bookImg", isbn+".jpg");
	                        
		                        URL imgurl = null;
		                        BufferedImage bi = null;
		                                
		                        imgurl = new URL(img);
		                        bi = ImageIO.read(imgurl);
		                        ImageIO.write(bi, "jpg", outputFile);
		                        b.setBookImg(isbn+".jpg");
	                        }break;
	                        
	                    case "author":
	                        if(b != null)
	                            b.setBookWriter(parser.nextText());
	                        break;
	                    
	                   
	                    case "publisher":
	                        if(b != null)
	                            b.setBookComp(parser.nextText());
	                        break;
	                   
	                    case "isbn":
	                        if(b != null)
	                            b.setIsbn(parser.nextText());
	                        break;
	                    case "description":
	                        if(b != null)
	                            b.setBookCont(parser.nextText());
	                        break;
	                    }
	                    
	                }
	                }
	                eventType = parser.next();
	            }
	            
	            
	            
	            
	        } catch (MalformedURLException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        } catch (UnsupportedEncodingException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        } catch (IOException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        } catch (XmlPullParserException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        }
	        System.out.println(list + "keyword"  );
	        return list;
	    }

	
}
