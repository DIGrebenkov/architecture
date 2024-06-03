workspace {
    name "Сервис доставки"
    description "Система, позволяющая осуществлять хранение, обработку и предоставление доступа к данным о пользователях и доставках"

    model {
        
        user     = person "Пользователь"
        delivery = softwareSystem "Система доставки" {
            description "Сервер управления системой доставки"

            user_service = container "User service" {
                description "Сервис управления пользователями"
            }

            delivery_service = container "Delivery service" {
                description "Сервис управления доставками"
            }

            db = container "Базы данных" {
                user_database = component "User Database" {
                    description "База данных пользователей и доставок"
                    technology "PostgreSQL 15"
                    tags "database"
                }

                user_cache = component "User Cache" {
                    description "Кэш данных пользователей для ускорения аутентификации"
                    technology "Redis"
                    tags "database"
                }

                delivery_database = component "Delivery Database" {
                    description "База данных для хранения информации о посылках"
                    technology "MongoDB 5"
                    tags "database"
                }
            }

            user_service -> user_database "Получение или обновление данных о пользователях" "TCP:5432"
            user_service -> user_cache "Получение данных о пользователях" "TCP:6379"

            delivery_service -> delivery_database "Получение или обновление данных о доставке" "TCP:27018"

            rel = user -> user_service "Создание нового пользователя или получение информации о нем" "REST HTTP:8080"
            user -> delivery_service "Создание новой доставки или получение информации о ней" "REST HTTP:8081"
        }

        user -> delivery "Запросы к системе доставки" "REST HTTP:8080"

        deploymentEnvironment "Production" {
            deploymentNode "User Server" {
                containerInstance user_service
            }

            deploymentNode "Delivery Server" {
                containerInstance delivery_service
                properties {
                    "CPU" "12"
                    "RAM" "256Gb"
                    "HDD" "4Tb"
                }
            }

            deploymentNode "databases" {
     
                deploymentNode "Database" {
                    containerInstance db
                }
            }
            
        }
    }

    views {
        themes default

        properties { 
            structurizr.tooltips true
        }

        systemContext delivery "Context" {
            include *
            exclude rel
            autoLayout 
        }

        container delivery "Container" {
            include *
            autoLayout
        }

        component db "Component" {
            include *
            autoLayout
        }

        deployment delivery Production {
            include *
            autoLayout
        }

        dynamic delivery "UC01" "Создание нового пользователя" {
            autoLayout
            user -> user_service "Создать нового пользователя (POST /user)"
            user_service -> db "Сохранить данные о пользователе" 
            user_service -> db "Сохранить данные о пользователе в кэш" 
        }

        dynamic delivery "UC02" "Поиск пользователя" {
            autoLayout
            user -> user_service "Найти пользователя (GET /user)"
            user_service -> db "Найти данные пользователя в кэше"
            user_service -> db "Найти данные пользователя в базе данных"
        }

        dynamic delivery "UC03" "Создание доставки" {
            autoLayout
            user -> delivery_service "Создать новую доставку (POST /delivery)"
            delivery_service -> db "Сохранить данные о доставке" 
        }

        dynamic delivery "UC04" "Получение информации о доставке" {
            autoLayout
            user -> delivery_service "Получить информацию о доставке (GET /delivery)"
            delivery_service -> db "Найти данные о доставке" 
        }


        styles {
            element "database" {
                shape cylinder
            }
        }
    }
}