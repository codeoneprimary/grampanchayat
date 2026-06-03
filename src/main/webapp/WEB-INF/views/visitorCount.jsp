<%@ page import="java.io.*" %>
<%
ServletContext context = application;
String filePath = context.getRealPath("/") + "counter.txt";
File file = new File(filePath);

int count = 0;

synchronized(this) {
    if (file.exists()) {
        BufferedReader br = new BufferedReader(new FileReader(file));
        String line = br.readLine();
        if (line != null) {
            count = Integer.parseInt(line.trim());
        }
        br.close();
    }

    count++;

    BufferedWriter bw = new BufferedWriter(new FileWriter(file));
    bw.write(String.valueOf(count));
    bw.close();
}

out.print(count);
%>
