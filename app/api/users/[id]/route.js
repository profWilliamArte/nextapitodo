import { NextResponse } from "next/server";
import pool from "@/app/libs/mysql";

export async function GET(request, { params }) {
    try {
      const id = params.id;
      const db = await pool.getConnection();
      const [rows] = await db.execute('SELECT * FROM users WHERE id = ?', [id]);
      db.release();
      // Si hay resultados, devolver el primer elemento; de lo contrario, devolver un objeto vacío
      const response = rows.length > 0 ? rows[0] : {};
      return NextResponse.json(response);
    } catch (error) {
      console.error(error);
      return NextResponse.json({ error: 'Internal server error' }, { status: 500 });
    }
}




export async function PUT(request, { params }) {
    try {
        const id = params.id; // Obtener el ID del parámetro
        const { usuario } = await request.json(); // Asegúrate de que el objeto usuario tenga las propiedades esperadas

        // Verifica que el objeto usuario tenga las propiedades necesarias
        if (!usuario || !id) {
            return NextResponse.json(
                { message: 'Faltan datos para actualizar el usuario' },
                { status: 400 }
            );
        }

        const db = await pool.getConnection(); // Obtener conexión a la base de datos
        const query = 'UPDATE users SET firstName = ?, lastName = ?, age = ?, gender = ?, email = ?, phone = ?, username = ?, password = ?, birthDate = ?, role = ?, address = ? WHERE id = ?';
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
            usuario.address,
            id // Asegúrate de incluir el ID en los valores
        ];

        const [result] = await db.execute(query, values); // Ejecutar la consulta
        db.release(); // Liberar la conexión

        if (result.affectedRows === 0) {
            return NextResponse.json(
                { message: 'Usuario no encontrado' },
                { status: 404 }
            );
        }

        // Si la actualización fue exitosa, puedes devolver el usuario actualizado
        const [updatedUser] = await db.query("SELECT * FROM users WHERE id = ?", [id]);
        return NextResponse.json(updatedUser[0]);

    } catch (error) {
        console.error('Error al actualizar el usuario:', error);
        return NextResponse.json(
            { message: 'Ocurrió un error al actualizar el usuario', details: error.message },
            { status: 500 }
        );
    }
}










/*
export async function PUT(request,{params}){
    try {
        const id = params.id;
        const { usuario } = await request.json(); 
        const result = await pool.query("UPDATE users SET ? WHERE id = ?", [data, id]);
        if(result.affectedRows  === 0)
        return NextResponse.json(
            {
                message: error.message,
            },
            {
                status: 404,
            } 
        );
        const resultProduct = await pool.query("SELECT * FROM users WHERE id = ?", [id]);
        return NextResponse.json(resultProduct[0]);

    } catch (error) {
        console.log('Error al Actualizar el Usuario');
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
        const result = await pool.query("DELETE FROM users WHERE id = ?", [id]);
        if(result.affectedRows  === 0){
            return NextResponse.json(
                {
                    message: "Usuario con "+id+" no encontrado", 
                },
                {
                    status: 404,
                }
            );
             
        };
        return NextResponse.json("Eliminado correctamente el id: "+id);
    } catch (error) {
        console.log('Error al eliminar el usuario');
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

*/