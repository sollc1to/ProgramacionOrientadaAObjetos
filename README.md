# 🏢 POO – Trabajo Final: Gestión de Contratos Inmobiliarios

> 🎓 Proyecto final de **Programación Orientada a Objetos** en **Smalltalk**.  
> Sistema para gestionar contratos de venta/alquiler de inmuebles, aplicando los 4 pilares de POO.



---

##  Objetivo

Modelar una empresa inmobiliaria que gestiona:
-  **Clientes**
-  **Inmuebles** (casas, departamentos, terrenos)
-  **Contratos** (venta, alquiler, temporal)

Aplicando los principios de POO:
| Principio | Aplicación en el proyecto |
|-----------|---------------------------|
| 🔹 Abstracción | Clases `Cliente`, `Inmueble`, `Contrato` representan entidades del dominio |
| 🔹 Encapsulamiento | Atributos privados con acceso mediante mensajes |
| 🔹 Herencia | `ContratoVenta` y `ContratoAlquiler` heredan de `Contrato` |
| 🔹 Polimorfismo | Método `calcularMonto()` se comporta distinto según el tipo de contrato |

