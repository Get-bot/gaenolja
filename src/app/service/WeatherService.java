package app.service;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;


@Service
public class WeatherService {	

	@Autowired
	Gson gson;
	
	public String getCoordinateByAddress(String address) {		
		String[] addressPart = address.split(" ");		
		String target = addressPart[1];			
		return target;
	}
	
	
	
	public String getWeatherByAddress(String address) {

		String addr = "https://dapi.kakao.com/v2/local/search/address.json";
		try {
			String location =  "전북 삼성동 100";				

			String apiKey = "KakaoAK f6338b38f25975f7c23d2cda09276c4e";

			location = URLEncoder.encode(location, "UTF-8");

			String query = "query=" + location;

			StringBuffer stringBuffer = new StringBuffer();
			stringBuffer.append(addr);
			stringBuffer.append("?");
			stringBuffer.append(query);  

			URL url = new URL(stringBuffer.toString());

			URLConnection conn = url.openConnection();

			conn.setRequestProperty("Authorization", apiKey);

			String line;
			BufferedReader rd = new BufferedReader(new InputStreamReader(conn.getInputStream(),"UTF-8"));


			String docJson = "";
			while((line=rd.readLine())!=null){
				docJson +=line;
			}

			if(0<docJson.toString().length()){
				System.out.println("docJson    :"+docJson.toString());

			}




			Map map = gson.fromJson(docJson, Map.class);
			System.out.println(map.get("documents"));
			rd.close();	
			List documents = (List) map.get("documents");
			Map road_address = (Map) documents.get(0);
			String address_name = (String) road_address.get("address_name");
			String x_coord = (String) road_address.get("x");
			String y_coord = (String) road_address.get("y");

			System.out.println(address_name);
			System.out.println(x_coord);
			System.out.println(y_coord);

		}catch(Exception e){
			e.printStackTrace();
		}
		
		return "";
	}
}


/*
	HTTP/1.1 200 OK
	Content-Type: application/json;charset=UTF-8
	{
	  "meta": {
	    "total_count": 4,
	    "pageable_count": 4,
	    "is_end": true
	  },
	  "documents": [
	    {
	      "address_name": "전북 익산시 부송동 100",
	      "y": "35.97664845766847",
	      "x": "126.99597295767953",
	      "address_type": "REGION_ADDR",
	      "address": {
	        "address_name": "전북 익산시 부송동 100",
	        "region_1depth_name": "전북",
	        "region_2depth_name": "익산시",
	        "region_3depth_name": "부송동",
	        "region_3depth_h_name": "삼성동",
	        "h_code": "4514069000",
	        "b_code": "4514013400",
	        "mountain_yn": "N",
	        "main_address_no": "100",
	        "sub_address_no": "",
	        "zip_code": "570972",
	        "x": "126.99597295767953",
	        "y": "35.97664845766847"
	      },
	      "road_address": {
	        "address_name": "전북 익산시 망산길 11-17",
	        "region_1depth_name": "전북",
	        "region_2depth_name": "익산시",
	        "region_3depth_name": "부송동",
	        "road_name": "망산길",
	        "underground_yn": "N",
	        "main_building_no": "11",
	        "sub_building_no": "17",
	        "building_name": "",
	        "zone_no": "54547",
	        "y": "35.976749396987046",
	        "x": "126.99599512792346"
	      }
	    },
	    ...
	  ]
	}
}
*/
