import { Sequelize, DataTypes } from "sequelize";

export const sequelize = new Sequelize("db", "user", "vuk43gtg6hR10Sev", {
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

const CarnivalType = sequelize.define("CarnivalType", {
    id: {
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

const CarnivalLocation = sequelize.define("CarnivalLocation", {
    id: {
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
Carnival.hasOne(CarnivalLocation, {
    foreignKey: "locationID"
});
