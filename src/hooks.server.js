import { Sequelize, DataTypes } from "sequelize";
import { MYSQL_ROOT_PW } from '$env/static/private'

export const sequelize = new Sequelize("db3nf", "root", MYSQL_ROOT_PW, { // insecure
    host: "localhost",
    dialect: "mysql",
    define: {
        timestamps: false
    }
});

export const Carnival = sequelize.define("Carnival", {
    id: {
        type: DataTypes.INTEGER,
        autoIncrement: true,
        allowNull: false,
        primaryKey: true
    },
    name: {
        type: DataTypes.STRING
    }, 
    typeID: {
        type: DataTypes.INTEGER
    },
    date: {
        type: DataTypes.DATEONLY
    },
    startTime: {
        type: DataTypes.TIME
    },
    endTime: {
        type: DataTypes.TIME
    },
    locationID: {
        type: DataTypes.INTEGER
    }
}, {
    tableName: "carnivals"
});

export const CarnivalType = sequelize.define("CarnivalType", {
    typeID: {
        type: DataTypes.INTEGER,
        autoIncrement: true,
        allowNull: false,
        primaryKey: true
    },
    type: {
        type: DataTypes.STRING,
        allowNull: false
    }
}, {
    tableName: "carnivalType"
});

export const CarnivalLocation = sequelize.define("CarnivalLocation", {
    locationID: {
        type: DataTypes.INTEGER,
        autoIncrement: true,
        allowNull: false,
        primaryKey: true
    },
    location: {
        type: DataTypes.STRING,
        allowNull: false
    }
}, {
    tableName: "carnivalLocation"
})

Carnival.hasOne(CarnivalType, {
    foreignKey: "typeID"
});
CarnivalType.belongsTo(Carnival, {
    foreignKey: "typeID"
});

Carnival.hasOne(CarnivalLocation, {
    foreignKey: "locationID"
});
CarnivalLocation.belongsTo(Carnival, {
    foreignKey: "locationID"
});
