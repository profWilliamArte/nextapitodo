import { NextResponse } from "next/server";
import pool from "@/app/libs/mysql";



export async function GET() {
    try {
        const db = await pool.getConnection()
        const query = 'select * from porhacer order by id desc'
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
      const { tarea } = await request.json();
      const completado='No';
      const fechacreacion = new Date();
      const fecharealizacion = new Date();
      const db = await pool.getConnection();
      const query = 'INSERT INTO  porhacer (tarea, completado, fechacreacion, fecharealizacion) VALUES (?, ?, ?, ?)';
      const [result] = await db.execute(query, [tarea, completado, fechacreacion, fecharealizacion]);
      db.release();
      return NextResponse.json({
        id: result.insertId,
        tarea,
        completado,
        fechacreacion,
        fecharealizacion
      }, { status: 201 });
    } catch (error) {
      console.error('Error en POST /api/todo:', error);
      return NextResponse.json({ error: 'Ocurrió un error al crear el todo' }, { status: 500 });
    }
}
