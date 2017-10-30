package com.nts.cozy.service;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import org.springframework.stereotype.Service;

import com.nts.cozy.exception.NaverSearchException;

/**
 * @author 신창환
 *
 */
@Service
public class NaverSearchService {

	public String getStoreInfos(String storeInfo) {
		String clientId = "gUgdBp5pZaoSL9VlayqH";
		String clientSecret = "WZ735niNRQ";
		StringBuffer response = new StringBuffer();

		try {
			String text = URLEncoder.encode(storeInfo, "UTF-8");
			String apiURL = "https://openapi.naver.com/v1/search/local?query=" + text;

			URL url = new URL(apiURL);

			HttpURLConnection con = (HttpURLConnection)url.openConnection();
			con.setRequestMethod("GET");
			con.setRequestProperty("X-Naver-Client-Id", clientId);
			con.setRequestProperty("X-Naver-Client-Secret", clientSecret);

			int responseCode = con.getResponseCode();

			BufferedReader br;
			if (responseCode == 200) {
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			} else {
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}

			String inputLine;
			while ((inputLine = br.readLine()) != null) {
				response.append(inputLine);
			}
			br.close();

		} catch (Exception e) {
			throw new NaverSearchException("Naver Search Exception");

		}

		return response.toString();
	}
}
