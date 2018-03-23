package kr.co.knoc.domestic.xml;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;

public class OilDateXmlParser {

 private List<HashMap<String, String>> dayList=null;
 private List<HashMap<String, String>> weekList=new ArrayList<HashMap<String,String>>();
 private Document doc=null;
 
 public   OilDateXmlParser(  String url)  {
	 DocumentBuilder docBuilder;
	try {
		docBuilder = DocumentBuilderFactory.newInstance().newDocumentBuilder();
		doc = docBuilder.parse(url);
		 
	} catch (ParserConfigurationException e) {
		e.printStackTrace();
	} catch (SAXException e) {
		e.printStackTrace();
	} catch (IOException e) {
		e.printStackTrace();
	}
		  
 }
 
 	/**
	 * 수정일 : 2015.03.25
	 * 수정자 : 마용민 (milgam12@inplusweb.com)
	 * 내  용 : 오피넷에서 제공하는 xml 파일의 format 이 변경됨
	 */
 	public List<HashMap<String, String>> getDomestic_oildataByInplus(String tagName) throws ParserConfigurationException, SAXException, IOException{
 		
 		List resultList = new ArrayList<HashMap<String,String>>();
 		Element docElement = doc.getDocumentElement();
 		
 		docElement.normalize();
 		System.out.println("Root element : " + doc.getDocumentElement().getNodeName());
		System.out.println();
				
		NodeList nodeList = docElement.getElementsByTagName(tagName);
		if (nodeList != null && nodeList.getLength() > 0) {
			for (int i = 0; i < nodeList.getLength(); i++) {
				Element element = (Element)nodeList.item(i);		
				
				HashMap map = new HashMap();
				
				// DATE												
				NodeList itemList = element.getElementsByTagName("DATE");
				Element itemElement = (Element)itemList.item(0);
				Node itemNode = itemElement.getFirstChild();				
				map.put("DATE", itemNode.getNodeValue());
				
				itemList = element.getElementsByTagName("PRODNM");
				itemElement = (Element)itemList.item(0);
				itemNode = itemElement.getFirstChild();				
				map.put("PRODNM", itemNode.getNodeValue());
				
				itemList = element.getElementsByTagName("PRICE");
				itemElement = (Element)itemList.item(0);
				itemNode = itemElement.getFirstChild();				
				map.put("PRICE", itemNode.getNodeValue());
				
				itemList = element.getElementsByTagName("DIFF");
				itemElement = (Element)itemList.item(0);
				itemNode = itemElement.getFirstChild();				
				map.put("DIFF", itemNode.getNodeValue());
				
				resultList.add(map);		        
			}
		    
		}
		
		return resultList;
	}
 	
 	
 
	public List<HashMap<String, String>> getDomestic_oildata(String tagName) throws ParserConfigurationException, SAXException, IOException{
		dayList=new ArrayList<HashMap<String,String>>();
		Element docElement = doc.getDocumentElement();

		NodeList nodeList = docElement.getElementsByTagName(tagName);
		if (nodeList != null && nodeList.getLength() > 0) {

		    for (int i = 0; i < nodeList.getLength(); i++) {
		        Element element = (Element) nodeList.item(i);
		        element.getChildNodes();
		        NodeList childList = element.getChildNodes();
		        HashMap map = new HashMap();
		        for (int a=0; a<childList.getLength(); a++){
		        	Node nodeLists = childList.item(a);
		        	map.put(nodeLists.getNodeName(),nodeLists.getTextContent());
		        }
		        dayList.add(map);
			}
		}
		return dayList;
	}
 	
	public List<HashMap<String, String>> getDomestic_week_oildata() throws ParserConfigurationException, SAXException, IOException{
		 
		NodeList nodeMomList = doc.getDocumentElement().getChildNodes();
		List xmlList = new ArrayList();

		for(int i=0; i<nodeMomList.getLength(); i++){
		  Node row = nodeMomList.item( i );
		  NodeList childList = row.getChildNodes();
		  
		  HashMap map = new HashMap();
		  for (int a=0; a<childList.getLength(); a++){
		  Node nodeList = childList.item(a);
		  System.out.println(nodeList.getNodeName());
		  System.out.println("nodeList.getNodeType()"+nodeList.getNodeType());
		  	if(1==nodeList.getNodeType()) {
			  xmlList.add(nodeList.getNodeName());
		  	}
		  }
		//if(map.get(파싱한 데이터 key) != null) 
		 
		}
		return getDomestic_oildata(  xmlList);
	}
	
	public List<HashMap<String, String>> getDomestic_oildata(List xmlList) throws ParserConfigurationException, SAXException, IOException{
		 List<HashMap<String, String>> list=new ArrayList<HashMap<String,String>>();
		 Element docElement = doc.getDocumentElement();
			for (int j = 0; j < xmlList.size(); j++) {
				NodeList nodeList = docElement.getElementsByTagName(xmlList.get(j).toString());
				if (nodeList != null && nodeList.getLength() > 0) {
				    for (int i = 0; i < nodeList.getLength(); i++) {
				        Element element = (Element) nodeList.item(i);
				        element.getChildNodes();
				        NodeList childList = element.getChildNodes();
				        HashMap map = new HashMap();
				        for (int a=0; a<childList.getLength(); a++){
				        	Node nodeLists = childList.item(a);
				        	map.put(nodeLists.getNodeName(),nodeLists.getTextContent());
				        }
				        list.add(map);
					}
				}
			}
		return list;
	}
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		 

	}

}
