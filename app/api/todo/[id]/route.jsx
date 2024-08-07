import { NextResponse } from "next/server";
import pool from "@/app/libs/mysql";

export async function GET(request, { params }) {
    try {
      const id = params.id;
      const db = await pool.getConnection();
      const [rows] = await db.execute('SELECT * FROM porhacer WHERE id = ?', [id]);
      db.release();
      // Si hay resultados, devolver el primer elemento; de lo contrario, devolver un objeto vacío
      const response = rows.length > 0 ? rows[0] : {};
      return NextResponse.json(response);
    } catch (error) {
      console.error(error);
      return NextResponse.json({ error: 'Internal server error' }, { status: 500 });
    }
}
export async function PUT(request,{params}){

    try {
        const id = params.id;
        const data = await request.json();
        const result = await pool.query("UPDATE porhacer SET ? WHERE id = ?", [data, id]);
        if(result.affectedRows  === 0)
        return NextResponse.json(
            {
                message: error.message,
            },
            {
                status: 404,
            } 
        );
        const resultProduct = await pool.query("SELECT * FROM porhacer WHERE id = ?", [id]);
        return NextResponse.json(resultProduct[0]);

    } catch (error) {
        console.log('Error al Actualizar los productos');
        return NextResponse.json(
            {
                message: error.message,
            },
            {
                status: 500,
            }
        );
    }
}

export async function DELETE(request,{params}){
    try {
        const id = params.id;
        const result = await pool.query("DELETE FROM porhacer WHERE id = ?", [id]);
        if(result.affectedRows  === 0){
            return NextResponse.json(
                {
                    message: "Todo con "+id+" no encontrado", 
                },
                {
                    status: 404,
                }
            );
             
        };
        return NextResponse.json("Eliminado correctamente el id: "+id);
    } catch (error) {
        console.log('Error al listar los productos');
        return NextResponse.json(
            {
                message: error.message,
            },
            {
                status: 500,
            }
        );
    }
}
