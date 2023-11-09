package controle;

import java.sql.Connection;
import java.sql.DriverManager;

import javax.swing.JOptionPane;

public class Conexao {
	
	static Connection conexao;
	
	public static Connection faz_conexao() {
		try {
			
			conexao = DriverManager.getConnection("jdbc:mysql://localhost:3306/projeto_supermercado", "root", "");
		} catch (Exception e) {
			JOptionPane.showMessageDialog(null, "Erro ao conectar ao banco de dados");
			
		}
		return conexao;
	}
	
	public void desconectar() {
		try {
			conexao.close();
		} catch (Exception e) {
			
		}
	}

}
