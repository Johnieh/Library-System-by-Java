package email;


import java.util.Date;
import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
 
public class SendEmail {
	// 发件人 账号和密码
	public static final String MY_EMAIL_ACCOUNT = "LWFSao@163.com";
	public static final String MY_EMAIL_PASSWORD = "root123456";// 密码,是你自己的设置的授权码
	
	// SMTP服务器(这里用的163 SMTP服务器)
	public static final String MEAIL_163_SMTP_HOST = "smtp.163.com";
	public static final String SMTP_163_PORT = "25";// 端口号,这个是163使用到的;QQ的应该是465或者875
	
	// 收件人
	
	

	public void send(String RECEIVE_EMAIL_ACCOUNT,String upasw) throws AddressException, MessagingException {
		Properties p = new Properties();
		p.setProperty("mail.smtp.host", MEAIL_163_SMTP_HOST);
		p.setProperty("mail.smtp.port", SMTP_163_PORT);
		p.setProperty("mail.smtp.socketFactory.port", SMTP_163_PORT);
		p.setProperty("mail.smtp.auth", "true");
		p.setProperty("mail.smtp.socketFactory.class", "SSL_FACTORY");
		
		Session session = Session.getInstance(p, new Authenticator() {
			// 设置认证账户信息
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(MY_EMAIL_ACCOUNT, MY_EMAIL_PASSWORD);
			}
		});
		session.setDebug(true);
		System.out.println("创建邮件");
		MimeMessage message = new MimeMessage(session);
		// 发件人
		message.setFrom(new InternetAddress(MY_EMAIL_ACCOUNT));
		// 收件人和抄送人
		message.setRecipients(Message.RecipientType.TO, RECEIVE_EMAIL_ACCOUNT);
//		message.setRecipients(Message.RecipientType.CC, MY_EMAIL_ACCOUNT);
		
		// 内容(这个内容还不能乱写,有可能会被SMTP拒绝掉;多试几次吧)
		/***  邮件标题****/
		message.setSubject("Library Information");
		/***  邮件内容设置****/
		message.setContent(upasw, "text/html;charset=UTF-8");
		message.setSentDate(new Date());
		message.saveChanges();
		System.out.println("准备发送");
		Transport.send(message);
	}
}
