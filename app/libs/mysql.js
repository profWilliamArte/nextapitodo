import mysql from 'mysql2/promise'
const pool = mysql.createPool({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'todo',
    waitForConnections: true
})
export default pool
