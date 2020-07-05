package com.kakao.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.kakao.VO.FieldVO;
import com.kakao.VO.MemberVO;
import com.kakao.VO.OrderVO;
import com.kakao.VO.ProductVO;
import com.kakao.VO.ResumeVO;


public class KakaoDao {

	private static boolean Idchk = false; //아이디 중복 : 같으면 true 다르면 false
	private static KakaoDao dao = new KakaoDao();
	
	private KakaoDao() {}
	
	public static KakaoDao getInstance()
	{
		return dao;
	}
	
	public Connection connect()
	{
		Connection conn = null;
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/kakao";
			String user = "root";
			String pwd = "cs1234";
			conn = DriverManager.getConnection(url,user,pwd);
		}
		catch(Exception e)
		{
			System.out.println("Connenction 오류발생 : " + e);
		}
		return conn;
	}
	public void close(Connection conn, PreparedStatement psmt)
	{
		if(psmt != null)
		{
			try
			{
				psmt.close();
			}
			catch(Exception e)
			{
				System.out.println("close : psmt 오류 발생 : " + e);
			}
		}
		
		if(conn != null)
		{
			try
			{
				conn.close();
			}
			catch(Exception e)
			{
				System.out.println("close : conn 오류 발생 : " + e);
			}
		}
	}
	
	public static boolean getIdchk()
	{
		return Idchk;
	}
	
	public boolean idCheck(String id)
	{
		Connection conn = null;
		PreparedStatement psmt = null;
		try
		{
			 ArrayList<MemberVO> list = memberList();
			 for(MemberVO memChk : list)
			 {
				 if(id.equals(memChk.getId()))
				 {
					 return false;
				 }
			 }
		}
		catch(Exception e)
		{
			System.out.println("idCheck : dao 오류 발생 -> " + e);
		}
		finally
		{
			close(conn, psmt);
		}
		return true;
	}
	public void memberInsert(MemberVO member)
	{
		Connection conn = null;
		PreparedStatement psmt = null;
		try
		{
			 ArrayList<MemberVO> list = memberList();
			 for(MemberVO memChk : list)
			 {
				 if((member.getId()).equals(memChk.getId()))
				 {
					 Idchk = true;
					 return;
				 }
			 }
			 conn = connect();
			 psmt = conn.prepareStatement("insert into member (id,pw,name,email,address,gender,phone,birthDate) values(?,?,?,?,?,?,?,?)");
			 psmt.setString(1,member.getId());
			 psmt.setString(2, member.getPw());
			 psmt.setString(3,member.getName());
			 psmt.setString(4,member.getPw());
			 psmt.setString(5, member.getAddress());
			 psmt.setString(6,member.getGender());
			 psmt.setString(7,member.getPhone());
			 psmt.setString(8,member.getBirthDate());
			 psmt.executeUpdate();
		}
		catch(Exception e)
		{
			System.out.println("MemberInsert : dao 오류 발생 -> " + e);
		}
		finally
		{
			close(conn, psmt);
		}
	}
	
	public String MemberLoginProcess(String id)
	{
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		String pw = null;
		try
		{
			conn = connect();
			psmt = conn.prepareStatement("select pw from member where id = ?");
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			while(rs.next())
			{
				pw = rs.getString(1);
			}
		}
		catch(Exception e)
		{
			System.out.println("exception 발생 : " + e);
		}
		
		finally
		{
			close(conn,psmt);
		}
		return pw;
	}
	
	public MemberVO MemberSearch(String id)
	{
		Connection conn = null;
		PreparedStatement psmt = null;
		MemberVO member = null;
		ResultSet rs = null;
		try
		{
			conn = connect();
			psmt = conn.prepareStatement("select * from member where id = ?");
			psmt.setString(1,id);
			rs = psmt.executeQuery();
			while(rs.next())
			{
				member = new MemberVO();
				member.setNum(rs.getInt(1));
				member.setId(rs.getString(2));
				member.setPw(rs.getString(3));
				member.setEmail(rs.getString(4));
				member.setName(rs.getString(5));
				member.setAddress(rs.getString(6));
				member.setCho(rs.getInt(7));
				member.setGender(rs.getString(8));
				member.setPhone(rs.getString(9));
				member.setBirthDate(rs.getString(10));
			}
		}
		catch(Exception e)
		{
			System.out.println("MemberSearch 오류 발생" + e);
		}
		finally
		{
			close(conn,psmt);
		}
		return member;
	}
	
	public void MemberUpdate(MemberVO member,int num) //수정은 어드민과 유저 둘다 가능
	// 어드민 버전
	
	{
		Connection conn = null;
		PreparedStatement psmt = null;
		try
		{
			conn = connect();
			psmt = conn.prepareStatement("update member set name = ?, address = ?, email = ?, pw = ? where num = ?");
			// name /  email / address / phone / pw
			psmt.setString(1,member.getName());
			psmt.setString(2, member.getAddress());
			psmt.setString(3, member.getEmail());
			psmt.setString(4, member.getPw());
			psmt.setInt(5, num);
			psmt.executeUpdate();
		}
		catch(Exception e)
		{
			System.out.println("MemberUpdate 오류 발생" + e);
		}
		finally
		{
			close(conn,psmt);
		}
	}
	
	public MemberVO MemberUpdate(int num)//유저의 정보를 지속적으로 갱신
	{
		Connection conn = null;
		PreparedStatement psmt = null;
		MemberVO member = null;
		ResultSet rs = null;
		try
		{
			conn = connect();
			psmt = conn.prepareStatement("select * from member where num = ?");
			psmt.setInt(1,num);
			rs = psmt.executeQuery();
			while(rs.next())
			{
				member = new MemberVO();
				member.setNum(rs.getInt(1));
				member.setId(rs.getString(2));
				member.setPw(rs.getString(3));
				member.setEmail(rs.getString(4));
				member.setName(rs.getString(5));
				member.setAddress(rs.getString(6));
				member.setCho(rs.getInt(7));
				member.setGender(rs.getString(8));
				member.setPhone(rs.getString(9));
				member.setBirthDate(rs.getString(10));
			}
		}
		catch(Exception e)
		{
			System.out.println("Memberupdate(갱신버전) 오류 발생" + e);
		}
		finally
		{
			close(conn,psmt);
		}
		return member;
	}
	public void MemberUpdate(MemberVO member)
	// 유저 버전
	{
		Connection conn = null;
		PreparedStatement psmt = null;
		try
		{
			conn = connect();
			System.out.println("member num : " + member.getNum());
			psmt = conn.prepareStatement("update member set name = ?, address = ?, email = ?, pw = ? where num = ?");
			// name /  email / address / phone / pw
			psmt.setString(1,member.getName());
			psmt.setString(2, member.getAddress());
			psmt.setString(3, member.getEmail());
			psmt.setString(4, member.getPw());
			psmt.setInt(5,member.getNum());
			psmt.executeUpdate();
		}
		catch(Exception e)
		{
			System.out.println("MemberUpdate 오류 발생" + e);
		}
		finally
		{
			close(conn,psmt);
		}
	}
	
	public void MemberDelete(int num)
	{
		Connection conn = null;
		PreparedStatement psmt = null;
		try
		{
			conn = connect();
			//해당 유저의지원서와 주문한 상품에 대해 모두 취소시키는 메소드 필요
			psmt = conn.prepareStatement("delete from member where num = ?");
			psmt.setInt(1,num);
			psmt.executeUpdate();
			psmt = conn.prepareStatement("delete from resume where userNum = ?");
			psmt.setInt(1,num);
			psmt.executeUpdate();
			psmt = conn.prepareStatement("delete from orderlist where userNum = ?");
			psmt.setInt(1,num);
			psmt.executeUpdate();
		}
		catch(Exception e)
		{
			System.out.println("MemberDelete 오류 발생 " + e);
		}
		finally
		{
			close(conn,psmt);
		}
	}
	public ArrayList<MemberVO> memberList()
	{
		Connection conn = null;
		PreparedStatement psmt = null;
		MemberVO member = null;
		ResultSet rs = null;
		ArrayList<MemberVO> list = new ArrayList<MemberVO>();
		try 
		{
			conn = connect();
			psmt = conn.prepareStatement("select * from member");
			rs = psmt.executeQuery();
			while(rs.next())
			{
				member = new MemberVO();			
				member.setNum(rs.getInt(1));
				member.setId(rs.getString(2));
				member.setPw(rs.getString(3));
				member.setEmail(rs.getString(4));
				member.setName(rs.getString(5));
				member.setAddress(rs.getString(6));
				member.setCho(rs.getInt(7));
				member.setGender(rs.getString(8));
				member.setPhone(rs.getString(9));
				member.setBirthDate(rs.getString(10));
				list.add(member);
			}
		}
		catch(Exception e)
		{
			System.out.println("memberlist 오류 발생 " + e);
		}
		
		finally
		{
			close(conn,psmt);
		}
		return list;
	}
	
	public String getMemberId(int num)
	{
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		String id = null;
		try 
		{
			conn = connect();
			psmt = conn.prepareStatement("select id from member where num = ?");
			psmt.setInt(1, num);
			rs = psmt.executeQuery();
			while(rs.next())
			{
				id = rs.getString(1);
			}
		}
		catch(Exception e)
		{
			System.out.println("getMemberId 오류 발생 " + e);
		}
		
		finally
		{
			close(conn,psmt);
		}
		return id;
	}
	public void resumeInsert(ResumeVO resume,int num)
	{
		Connection conn = null;
		PreparedStatement psmt = null;
		try
		{
			conn = connect();
			psmt = conn.prepareStatement("insert into resume(title,content,field,userNum) values(?,?,?,?)");
			psmt.setString(1,resume.getTitle());
			psmt.setString(2,resume.getContent());
			psmt.setString(3,resume.getField());
			psmt.setInt(4,num);
			psmt.executeUpdate();
		}
		catch(Exception e)
		{
			System.out.println("ResumeInsert : dao 오류 발생 -> " + e);
		}
		finally
		{
			close(conn, psmt);
		}
	}
	
	public void resumeDelete(int num)
	{
		Connection conn = null;
		PreparedStatement psmt = null;
		try
		{
			conn = connect();
			psmt = conn.prepareStatement("delete from resume where userNum = ? ");
			psmt.setInt(1,num);
			psmt.executeUpdate();
		}
		catch(Exception e)
		{
			System.out.println("ResumeDelete: dao 오류 발생 -> " + e);
		}
		finally
		{
			close(conn, psmt);
		}
	}
	
	public void resumeUpdate(ResumeVO resume,int num)
	{
		Connection conn = null;
		PreparedStatement psmt = null;
		try
		{
			conn = connect();
			psmt = conn.prepareStatement("update resume set title = ? ,content = ?, field = ? where userNum = ? ");
			psmt.setString(1,resume.getTitle());
			psmt.setString(2,resume.getContent());
			psmt.setString(3,resume.getField());
			psmt.setInt(4,num);
			psmt.executeUpdate();
		}
		catch(Exception e)
		{
			System.out.println("ResumeUpdate : dao 오류 발생 -> " + e);
		}
		finally
		{
			close(conn, psmt);
		}
	}
	public ResumeVO searchResume(String id)
	{
		System.out.println("search id : " + id);
		Connection conn = null;
		PreparedStatement psmt = null;
		ResumeVO resume = null;
		ResultSet rs = null;
		int userNum = 0;
		try 
		{
			conn = connect();
			psmt = conn.prepareStatement("select num from member where id = ?");
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			while(rs.next())
			{
				userNum = rs.getInt(1);
			}
			psmt = conn.prepareStatement("select title,field,userNum from resume where userNum = ?");
			psmt.setInt(1,userNum);
			rs = psmt.executeQuery();
			while(rs.next())
			{
				resume = new ResumeVO();
				resume.setTitle(rs.getString(1));
				resume.setField(rs.getString(2));
				resume.setUserNum(rs.getInt(3));
			}
		}
		catch(Exception e)
		{
			System.out.println("resumeSearch 오류 발생 " + e);
		}
		
		finally
		{
			close(conn,psmt);
		}
		return resume;
	}
	public ArrayList<ResumeVO> searchResumeWN(String name)
	{ // with name
		System.out.println("name in dao : " + name);
		Connection conn = null;
		PreparedStatement psmt = null;
		ResumeVO resume = null;
		ResultSet rs = null;
		ArrayList<ResumeVO> list = new ArrayList<ResumeVO>();
		try 
		{
			conn = connect();
			psmt = conn.prepareStatement("select title,field,userNum from resume where field = ?");
			psmt.setString(1, name);
			rs = psmt.executeQuery();
			while(rs.next())
			{
				resume = new ResumeVO();
				resume.setTitle(rs.getString(1));
				resume.setField(rs.getString(2));
				resume.setUserNum(rs.getInt(3));
				list.add(resume);
			}
		}
		catch(Exception e)
		{
			System.out.println("resumelistWN 오류 발생 " + e);
		}
		
		finally
		{
			close(conn,psmt);
		}
		return list;
	}
	public ResumeVO showResume(int num) 
	{
		Connection conn = null;
		PreparedStatement psmt = null;
		ResumeVO resume = null;
		ResultSet rs = null;
		try 
		{
			conn = connect();
			psmt = conn.prepareStatement("select title,field,content from resume where userNum = ?");
			psmt.setInt(1, num);
			rs = psmt.executeQuery();
			while(rs.next())
			{
				resume = new ResumeVO();
				resume.setTitle(rs.getString(1));
				resume.setField(rs.getString(2));
				resume.setContent(rs.getString(3));
			}
		}
		catch(Exception e)
		{
			System.out.println("showResume 오류 발생 " + e);
		}
		
		finally
		{
			close(conn,psmt);
		}
		return resume;
	}
	
	public ArrayList<ResumeVO> getResumeList()
	{
		Connection conn = null;
		PreparedStatement psmt = null;
		ResumeVO resume = null;
		ResultSet rs = null;
		ArrayList<ResumeVO> list = new ArrayList<ResumeVO>();
		try 
		{
			conn = connect();
			psmt = conn.prepareStatement("select title,field,userNum from resume");
			rs = psmt.executeQuery();
			while(rs.next())
			{
				resume = new ResumeVO();
				resume.setTitle(rs.getString(1));
				resume.setField(rs.getString(2));
				resume.setUserNum(rs.getInt(3));
				list.add(resume);
			}
		}
		catch(Exception e)
		{
			System.out.println("resumelist 오류 발생 " + e);
		}
		
		finally
		{
			close(conn,psmt);
		}
		return list;
	}
	
	public void insertField(FieldVO field)
	{
		Connection conn = null;
		PreparedStatement psmt = null;
		try
		{
			conn = connect();
			psmt = conn.prepareStatement("insert into field(name,exp,recruitNum,workPlace,employeeType,division) values(?,?,?,?,?,?)");
			psmt.setString(1,field.getName());
			psmt.setString(2,field.getExplain());
			psmt.setInt(3,field.getRecruitNum());
			psmt.setString(4, field.getWorkPlace());
			psmt.setString(5, field.getEmployeeType());
			psmt.setString(6, field.getDivision());
			psmt.executeUpdate();
		}
		catch(Exception e)
		{
			System.out.println("fieldInsert : dao 오류 발생 -> " + e);
		}
		finally
		{
			close(conn, psmt);
		}
	}
	public ArrayList<FieldVO> getFieldList()
	{
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		ArrayList<FieldVO> list = new ArrayList<FieldVO>();
		FieldVO field = null;
		try 
		{
			conn = connect();
			psmt = conn.prepareStatement("select * from field");
			rs = psmt.executeQuery();
			while(rs.next())
			{
				field = new FieldVO();
				field.setNum(rs.getInt(1));
				field.setName(rs.getString(2));
				field.setExplain(rs.getString(3));
				field.setRecruitNum(rs.getInt(4));
				field.setWorkPlace(rs.getString(5));
				field.setEmployeeType(rs.getString(6));
				field.setDivision(rs.getString(7));
				list.add(field);
			}
		}
		catch(Exception e)
		{
			System.out.println("fieldlist 오류 발생 " + e);
		}
		
		finally
		{
			close(conn,psmt);
		}
		return list;
	}
	
	public ArrayList<FieldVO> fieldDivisionSearch(String division)
	{
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		ArrayList<FieldVO> list = new ArrayList<FieldVO>();
		FieldVO field = null;
		try 
		{
			conn = connect();
			psmt = conn.prepareStatement("select * from field where division = ?");
			psmt.setString(1, division);
			rs = psmt.executeQuery();
			while(rs.next())
			{
				field = new FieldVO();
				field.setNum(rs.getInt(1));
				field.setName(rs.getString(2));
				field.setExplain(rs.getString(3));
				field.setRecruitNum(rs.getInt(4));
				field.setWorkPlace(rs.getString(5));
				field.setEmployeeType(rs.getString(6));
				field.setDivision(rs.getString(7));
				list.add(field);
			}
		}
		catch(Exception e)
		{
			System.out.println("fieldlist(division search) 오류 발생 " + e);
		}
		
		finally
		{
			close(conn,psmt);
		}
		return list;
	}
	public FieldVO searchField(String name)
	{
		System.out.println("search name in dao : " + name);
		Connection conn = null;
		PreparedStatement psmt = null;
		FieldVO field = null;
		ResultSet rs = null;
		try 
		{
			conn = connect();
			psmt = conn.prepareStatement("select * from field where name = ?");
			psmt.setString(1,name);
			rs = psmt.executeQuery();
			while(rs.next())
			{				
				field = new FieldVO();
				field.setNum(rs.getInt(1));
				field.setName(rs.getString(2));
				field.setExplain(rs.getString(3));
				field.setRecruitNum(rs.getInt(4));
				field.setWorkPlace(rs.getString(5));
				field.setEmployeeType(rs.getString(6));
				field.setDivision(rs.getString(7));
			}
		}
		catch(Exception e)
		{
			System.out.println("fieldSearch 오류 발생 " + e);
		}
		
		finally
		{
			close(conn,psmt);
		}
		if(field == null)
		{
			System.out.println("field is null");
		}
		return field;
	}
	public void fieldUpdate(FieldVO field,int num)
	{
		Connection conn = null;
		PreparedStatement psmt = null;
		try
		{
			conn = connect();
			psmt = conn.prepareStatement("update field set name = ?, exp = ? , recruitNum = ?, workPlace = ?, employeeType = ?, division = ? where num = ?");
			psmt.setString(1,field.getName());
			psmt.setString(2,field.getExplain());
			psmt.setInt(3,field.getRecruitNum());
			psmt.setString(4, field.getWorkPlace());
			psmt.setString(5,field.getEmployeeType());
			psmt.setString(6, field.getDivision());
			psmt.setInt(7,num);
			psmt.executeUpdate();
		}
		catch(Exception e)
		{
			System.out.println("FieldUpdate : dao 오류 발생 -> " + e);
		}
		finally
		{
			close(conn, psmt);
		}
	}
	
	public void fieldDelete(int num)
	{
		Connection conn = null;
		PreparedStatement psmt = null;
		try
		{
			conn = connect();
			psmt = conn.prepareStatement("delete from field where num = ? ");
			psmt.setInt(1,num);
			psmt.executeUpdate();
		}
		catch(Exception e)
		{
			System.out.println("FieldDelete : dao 오류 발생 -> " + e);
		}
		finally
		{
			close(conn, psmt);
		}
	}

	public void insertProduct(ProductVO product)
	{
		Connection conn = null;
		PreparedStatement psmt = null;
		try
		{
			conn = connect();
			psmt = conn.prepareStatement("insert into product(name,price,detail,image,cha,category) values(?,?,?,?,?,?)");
			psmt.setString(1,product.getName());
			psmt.setInt(2, product.getPrice());
			psmt.setString(3,product.getDetail());
			psmt.setString(4,product.getImage());
			psmt.setString(5,product.getCha());
			psmt.setString(6, product.getCategory());
			psmt.executeUpdate();
		}
		catch(Exception e)
		{
			System.out.println("Productinsert : dao 오류 발생 -> " + e);
		}
		finally
		{
			close(conn, psmt);
		}
	}
	
	public void updateProduct(ProductVO product,int num)
	{
		Connection conn = null;
		PreparedStatement psmt = null;
		try
		{
			conn = connect();
			psmt = conn.prepareStatement("update product set name = ? ,price = ?,detail = ?,image = ?,cha = ?,category = ? where num = ? ");
			psmt.setString(1,product.getName());
			psmt.setInt(2, product.getPrice());
			psmt.setString(3,product.getDetail());
			psmt.setString(4,product.getImage());
			psmt.setString(5,product.getCha());
			psmt.setString(6, product.getCategory());
			psmt.setInt(7, num);
			psmt.executeUpdate();
		}
		catch(Exception e)
		{
			System.out.println("Productupdate : dao 오류 발생 -> " + e);
		}
		finally
		{
			close(conn, psmt);
		}
	}
	
	public void deleteProduct(int num)
	{
		Connection conn = null;
		PreparedStatement psmt = null;
		try
		{
			conn = connect();
			psmt = conn.prepareStatement("delete from product where num = ? ");
			psmt.setInt(1, num);
			psmt.executeUpdate();
		}
		catch(Exception e)
		{
			System.out.println("Productdelete : dao 오류 발생 -> " + e);
		}
		finally
		{
			close(conn, psmt);
		}
	}
	
	public ProductVO searchProduct(String name)
	{
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		ProductVO product = null;
		try
		{
			conn = connect();
			psmt = conn.prepareStatement("select * from product where name = ?");
			psmt.setString(1,name);
			rs = psmt.executeQuery();
			while(rs.next())
			{
				product = new ProductVO();
				product.setNum(rs.getInt(1));
				product.setName(rs.getString(2));
				product.setPrice(rs.getInt(3));
				product.setDetail(rs.getString(4));
				product.setImage(rs.getString(5));
				product.setCha(rs.getString(6));
				product.setCategory(rs.getString(7));
				product.setNumOfSale(rs.getInt(8));
			}
		}
		catch(Exception e)
		{
			System.out.println("Productsearch : dao 오류 발생 -> " + e);
		}
		finally
		{
			close(conn, psmt);
		}
		return product;
	}
	
	public ArrayList<ProductVO> getProductList()
	{
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		ArrayList<ProductVO> list = new ArrayList<ProductVO>();
		ProductVO product = null;
		try
		{
			conn = connect();
			psmt = conn.prepareStatement("select * from product");
			rs = psmt.executeQuery();
			while(rs.next())
			{
				product = new ProductVO();
				product.setNum(rs.getInt(1));
				product.setName(rs.getString(2));
				product.setPrice(rs.getInt(3));
				product.setDetail(rs.getString(4));
				product.setImage(rs.getString(5));
				product.setCha(rs.getString(6));
				product.setCategory(rs.getString(7));
				product.setNumOfSale(rs.getInt(8));
				list.add(product);
			}
		}
		catch(Exception e)
		{
			System.out.println("Productsearch : dao 오류 발생 -> " + e);
		}
		finally
		{
			close(conn, psmt);
		}
		return list;
	}
	
	public ArrayList<ProductVO> getProductListByOrder(String cha, String category)
	{
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		System.out.println("charcter : " + cha + " category : " + category);
		ArrayList<ProductVO> list = new ArrayList<ProductVO>();
		ProductVO product = null;
		try
		{
			conn = connect();
			psmt = conn.prepareStatement("select * from product where cha = ? and category = ? order by numOfSale desc");
			psmt.setString(1,cha);
			psmt.setString(2, category);
			rs = psmt.executeQuery();
			while(rs.next())
			{
				product = new ProductVO();
				product.setNum(rs.getInt(1));
				product.setName(rs.getString(2));
				product.setPrice(rs.getInt(3));
				product.setDetail(rs.getString(4));
				product.setImage(rs.getString(5));
				product.setCha(rs.getString(6));
				product.setCategory(rs.getString(7));
				product.setNumOfSale(rs.getInt(8));
				list.add(product);
			}
		}
		catch(Exception e)
		{
			System.out.println("Productsearch(카테고리,캐릭터) order : dao 오류 발생 -> " + e);
		}
		finally
		{
			close(conn, psmt);
		}
		return list;
	}
	
	public ArrayList<ProductVO> getProductList(String cha, String category)
	{
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		System.out.println("charcter : " + cha + " category : " + category);
		ArrayList<ProductVO> list = new ArrayList<ProductVO>();
		ProductVO product = null;
		try
		{
			conn = connect();
			psmt = conn.prepareStatement("select * from product where cha = ? and category = ?");
			psmt.setString(1,cha);
			psmt.setString(2, category);
			rs = psmt.executeQuery();
			while(rs.next())
			{
				product = new ProductVO();
				product.setNum(rs.getInt(1));
				product.setName(rs.getString(2));
				product.setPrice(rs.getInt(3));
				product.setDetail(rs.getString(4));
				product.setImage(rs.getString(5));
				product.setCha(rs.getString(6));
				product.setCategory(rs.getString(7));
				product.setNumOfSale(rs.getInt(8));
				list.add(product);
			}
		}
		catch(Exception e)
		{
			System.out.println("Productsearch(카테고리,캐릭터) : dao 오류 발생 -> " + e);
		}
		finally
		{
			close(conn, psmt);
		}
		return list;
	}

	public void registerCoin(int coin,int num) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement psmt = null;
		try
		{
			conn = connect();
			psmt = conn.prepareStatement("update member set cho = cho + ? where num = ?");
			psmt.setInt(1, coin);
			psmt.setInt(2,num);
			psmt.executeUpdate();
		}
		catch(Exception e)
		{
			System.out.println("register coin : dao 오류 발생 -> " + e);
		}
		finally
		{
			close(conn, psmt);
		}
	}
	
	public void buyProduct(int userNum,int productNum, int totalPrice,int count, String productName)
	{
		Connection conn = null;
		PreparedStatement psmt = null;
		String inDate   = new java.text.SimpleDateFormat("yyyy/MM/dd").format(new java.util.Date());
		try
		{
			conn = connect();
			psmt = conn.prepareStatement("update member set cho = cho - ? where num = ?");
			psmt.setInt(1, totalPrice);
			psmt.setInt(2,userNum);
			psmt.executeUpdate();
			psmt = conn.prepareStatement("update product set numOfSale = numOfSale + (?/price) where num = ?");
			psmt.setInt(1, totalPrice);
			psmt.setInt(2,productNum);
			psmt.executeUpdate();
			psmt = conn.prepareStatement("insert into orderlist(userNum,productNum,productName,count,date) values(?,?,?,?,?)");
			psmt.setInt(1, userNum);
			psmt.setInt(2, productNum);
			psmt.setString(3,productName);
			psmt.setInt(4, count);
			psmt.setString(5,inDate);
			psmt.executeUpdate();
		}
		catch(Exception e)
		{
			System.out.println("BUYPRODUCT : dao 오류 발생 -> " + e);
		}
		finally
		{
			close(conn, psmt);
		}
	}
	public ArrayList<OrderVO> searchOrder(String name)
	{
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		ArrayList<OrderVO> list = new ArrayList<OrderVO>();
		OrderVO order = null;
		try
		{
			conn = connect();
			psmt = conn.prepareStatement("select * from orderlist where productName = ?");
			psmt.setString(1, name);
			rs = psmt.executeQuery();
			while(rs.next())
			{
				order = new OrderVO();
				order.setNum(rs.getInt(1));
				order.setUserNum(rs.getInt(2));
				order.setProductNum(rs.getInt(3));
				order.setCount(rs.getInt(4));
				order.setDate(rs.getString(5));
				order.setProductName(rs.getString(6));
				list.add(order);
			}
		}
		catch(Exception e)
		{
			System.out.println("ordersearch : dao 오류 발생 -> " + e);
		}
		finally
		{
			close(conn, psmt);
		}
		return list;
	}
	
	public ArrayList<OrderVO> getOrderList()
	{
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		ArrayList<OrderVO> list = new ArrayList<OrderVO>();
		OrderVO order = null;
		try
		{
			conn = connect();
			psmt = conn.prepareStatement("select * from orderlist");
			rs = psmt.executeQuery();
			while(rs.next())
			{
				order = new OrderVO();
				order.setNum(rs.getInt(1));
				order.setUserNum(rs.getInt(2));
				order.setProductNum(rs.getInt(3));
				order.setCount(rs.getInt(4));
				order.setDate(rs.getString(5));
				order.setProductName(rs.getString(6));
				list.add(order);
			}
		}
		catch(Exception e)
		{
			System.out.println("orderlist : dao 오류 발생 -> " + e);
		}
		finally
		{
			close(conn, psmt);
		}
		return list;
	}
	
	public ArrayList<OrderVO> getOrderList(int userNum)
	{
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		ArrayList<OrderVO> list = new ArrayList<OrderVO>();
		OrderVO order = null;
		try
		{
			conn = connect();
			psmt = conn.prepareStatement("select * from orderlist where userNum = ?");
			psmt.setInt(1, userNum);
			rs = psmt.executeQuery();
			while(rs.next())
			{
				order = new OrderVO();
				order.setNum(rs.getInt(1));
				order.setUserNum(rs.getInt(2));
				order.setProductNum(rs.getInt(3));
				order.setCount(rs.getInt(4));
				order.setDate(rs.getString(5));
				order.setProductName(rs.getString(6));
				list.add(order);
			}
		}
		catch(Exception e)
		{
			System.out.println("orderlist(user) : dao 오류 발생 -> " + e);
		}
		finally
		{
			close(conn, psmt);
		}
		return list;
	}
}
