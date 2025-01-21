import kam.v1.app_configuration as ac
import service
import service.container as c
import network as n
import mysql

# main.k declares the customized configuration codes for default-with-db stack. 
quickstart: ac.AppConfiguration {
    workload: service.Service {
        containers: {
            quickstart: c.Container {
                image: "kusionstack/kusion-quickstart:latest"
                env: {
                    "DB_HOST": "$(KUSION_DB_HOST_QUICKSTARTWITHDBDEFAULTWITHDBQU)"
                    "DB_USERNAME": "$(KUSION_DB_USERNAME_QUICKSTARTWITHDBDEFAULTWITHDBQU)"
                    "DB_PASSWORD": "$(KUSION_DB_PASSWORD_QUICKSTARTWITHDBDEFAULTWITHDBQU)"
                }
            }
        }
    }
    accessories: {
        "network": n.Network {
            ports: [
                n.Port {
                    port: 8080
                }
            ]
        }
        "mysql": mysql.MySQL {
            type: "local"
            version: "8.0"
        }
    }
}
