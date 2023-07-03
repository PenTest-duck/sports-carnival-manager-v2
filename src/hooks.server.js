// Imports
import { Sequelize } from "sequelize";

// Import environment variables (security)
import { MYSQL_HOST, MYSQL_DB, MYSQL_USER, MYSQL_PW } from '$env/static/private'

// Initialise MySQL database connection
export const sequelize = new Sequelize(MYSQL_DB, MYSQL_USER, MYSQL_PW, {
    host: MYSQL_HOST,
    dialect: "mysql",
    define: {
        timestamps: false // Turn off automatic timestamping
    }
});