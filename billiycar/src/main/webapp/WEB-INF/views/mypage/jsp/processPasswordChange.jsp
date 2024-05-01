<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.net.*" %>

<%
// Google reCAPTCHA 비밀 키
String secretKey = "6LfQ8swpAAAAAMfwmMU-_UGqKZL_96D04eJGk2CA";

// 클라이언트에서 제출한 reCAPTCHA 응답
String captchaResponse = request.getParameter("g-recaptcha-response");

// 클라이언트 IP 주소
String remoteAddr = request.getRemoteAddr();

// Google reCAPTCHA 서버로 검증 요청
String url = "https://www.google.com/recaptcha/api/siteverify";
String param = "secret=" + secretKey + "&response=" + captchaResponse + "&remoteip=" + remoteAddr;

URLConnection connection = new URL(url + "?" + param).openConnection();
connection.setRequestProperty("Accept-Charset", "UTF-8");
InputStream responseStream = connection.getInputStream();
Scanner scanner = new Scanner(responseStream, "UTF-8");
String responseString = scanner.useDelimiter("\\A").next();
scanner.close();
responseStream.close();

// JSON 문자열을 파싱하여 필요한 정보를 추출합니다.
Map<String, Object> jsonResponse = new HashMap<>();
for (String pair : responseString.split(",")) {
    String[] keyValue = pair.split(":");
    jsonResponse.put(keyValue[0].trim().replaceAll("\"", ""), keyValue[1].trim().replaceAll("\"", ""));
}

// reCAPTCHA 검증 결과를 확인합니다.
boolean success = Boolean.parseBoolean(jsonResponse.get("success").toString());

if (success) {
    // reCAPTCHA 검증이 성공한 경우 비밀번호 변경 로직을 수행합니다.
    String currentPassword = request.getParameter("currentPassword");
    String newPassword = request.getParameter("newPassword");
    String confirmPassword = request.getParameter("confirmPassword");

    // 여기서 실제로 비밀번호 변경 로직을 구현합니다.
    // 예를 들어, 데이터베이스에 접근하여 사용자의 비밀번호를 변경하거나 다른 로직을 수행할 수 있습니다.
    // 이 예시에서는 간단히 변경된 비밀번호를 콘솔에 출력하는 것으로 대체합니다.
    System.out.println("비밀번호 변경 요청을 받았습니다.");
    System.out.println("현재 비밀번호: " + currentPassword);
    System.out.println("새로운 비밀번호: " + newPassword);
    System.out.println("새로운 비밀번호 확인: " + confirmPassword);
} else {
    // reCAPTCHA 검증이 실패한 경우 적절한 오류 처리를 수행합니다.
    out.println("reCAPTCHA 검증에 실패했습니다.");
}
%>
