import { NextResponse } from "next/server";
import pool from "@/app/libs/mysql";



export async function GET() {
    try {
        const db = await pool.getConnection()
        const query = 'select * from users'
        const [rows] = await db.execute(query)
        db.release()
        
       // return NextResponse.json(rows)
        return NextResponse.json({ results: rows })
    } catch (error) {
        return NextResponse.json({
            error: error
        }, { status: 500 })
    }
}
export async function POST(request) {
    try {
      const { usuario } = await request.json(); // Asegúrate de que esto esté correcto
      console.log(usuario); // Verifica que el objeto usuario tenga las propiedades esperadas
  
      const db = await pool.getConnection();
      const query = 'INSERT INTO users (firstName, lastName, age, gender, email, phone, username, password, birthDate, role, address) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)';
      const values = [
        usuario.firstName,
        usuario.lastName,
        usuario.age,
        usuario.gender,
        usuario.email,
        usuario.phone,
        usuario.username,
        usuario.password,
        usuario.birthDate,
        usuario.role,
        usuario.address
      ];
      const [result] = await db.execute(query, values);
      db.release();
      return NextResponse.json({
        id: result.insertId,
        ...usuario
      }, { status: 201 });
    } catch (error) {
      console.error('Error en POST /api/users:', error);
      return NextResponse.json({ 
        error: 'Ocurrió un error al crear el usuario', 
        details: error.message 
      }, { status: 500 });
    }
  }
  

  