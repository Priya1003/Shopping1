package otp;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.Random;

public class OtpValidation {
	public  String generateOtp() {
		String otp="";
		Random random=new Random();
		for(int i=0;i<4;i++) {
			otp+=random.nextInt(10);
		}
		return otp;
	}
	public boolean sendOtp(String otp,String message,String number) {
		//String api="1v9YDgbnR6M8de0Wq7cLFyjpI4VzOrQTmlCsGABuXfxk3KaUZPi1XzWfs9UIpZuGMT4tyrxmbaeEPnRh";
		String api="zajOyK1rqcXMPlAnG9em23vVpHitbIwsTEhoSZxY5CNgJUWBkRdC0PbL5Dyvhz9g28OB3WXNkVntYwHT";
		
		boolean validation=false;
		try {
			message=URLEncoder.encode(message,"UTF-8");
			String myUrl="https://www.fast2sms.com/dev/bulkV2?authorization="+api+"&sender_id=TXTIND&message="+message+"&route=v3&numbers="+number;
			URL url=new URL(myUrl);
			HttpURLConnection con=(HttpURLConnection) url.openConnection();
			con.setRequestMethod("GET");
			con.setRequestProperty("User-Agent", "Mozilla/5.0");
			System.out.println("wait...");
			int resCode=con.getResponseCode();
			System.out.println("resCode: "+resCode);			
			StringBuffer sb=new StringBuffer();
			BufferedReader br=new BufferedReader(new InputStreamReader(con.getInputStream()));
			
			while(true) {
				String line=br.readLine();
				if(line==null) {
					validation=true;
					break;
				}
				sb.append(line);
			}
			System.out.println(sb);
			return validation;
		} catch (IOException e) {
			return validation;
		}
	}
}