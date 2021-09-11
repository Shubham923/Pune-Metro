package verification;
    import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
     
    public class SendSms {
    	public void SendOtp(String s) {
    		try {
    			// Construct data
    			String apiKey = "apikey=" + "Y6SceGpmEp0-fHusCXpWfRLd2ja1rzgCASUUPVeM9Z";
    			String message = "&message=" + "Thanks for Registering with Pune Metro!! Your OTP is ::";
    			String sender = "&sender=" + "TXTLCL";
    			String numbers = "&numbers=" + s;
    			
    			// Send data
    			HttpURLConnection conn = (HttpURLConnection) new URL("https://api.textlocal.in/send/?").openConnection();
    			String data = apiKey + numbers + message + sender;
    			conn.setDoOutput(true);
    			conn.setRequestMethod("POST");
    			conn.setRequestProperty("Content-Length", Integer.toString(data.length()));
    			conn.getOutputStream().write(data.getBytes("UTF-8"));
    			final BufferedReader rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
    			final StringBuffer stringBuffer = new StringBuffer();
    			String line;
    			while ((line = rd.readLine()) != null) {
    				stringBuffer.append(line);
    			}
    			rd.close();
    			System.out.println(stringBuffer.toString());
    			//return stringBuffer.toString();
    		} catch (Exception e) {
    			System.out.println("Error SMS "+e);
    			//return "Error "+e;
    		}
    	}
    }
    
    