import 'dart:io';
class Chocolate {
  String tipo;
  double precio;

  Chocolate(this.tipo, this.precio);
}
class Compra {
  Chocolate chocolate;
  int cantidad;

  Compra(this.chocolate, this.cantidad);

  double calcularImporte() {
    return chocolate.precio * cantidad;
  }
  double calcularDescuento() {
    double importe = calcularImporte();
    double descuentoPorcentaje;

    if (cantidad < 5) {
      descuentoPorcentaje = 0.04;
    } else if (cantidad < 10) {
      descuentoPorcentaje = 0.065;
    } else if (cantidad < 15) {
      descuentoPorcentaje = 0.09;
    } else {
      descuentoPorcentaje = 0.115;
    }

    return importe * descuentoPorcentaje;
  }
  double importeAPagar() {
    double importe = calcularImporte();
    double descuento = calcularDescuento();
    return importe - descuento;
  }
  int cantidadCaramelos() {
    double importe = importeAPagar();
    int caramelosPorChocolate = importe >= 250 ? 3 : 2;
    return cantidad * caramelosPorChocolate;
  }
}
void main() {
  Chocolate primor = Chocolate('Primor', 8.5);
  Chocolate dulzura = Chocolate('Dulzura', 10.0);
  Chocolate tentacion = Chocolate('Tentación', 7.0);
  Chocolate explosion = Chocolate('Explosión', 12.5);
  print('Seleccione el tipo de chocolate:');
  print('1. Primor');
  print('2. Dulzura');
  print('3. Tentación');
  print('4. Explosión');
  int seleccion = int.parse(stdin.readLineSync() ?? '1');
  Chocolate chocolateSeleccionado;
  switch (seleccion) {
    case 1:
      chocolateSeleccionado = primor;
      break;
    case 2:
      chocolateSeleccionado = dulzura;
      break;
    case 3:
      chocolateSeleccionado = tentacion;
      break;
    case 4:
      chocolateSeleccionado = explosion;
      break;
    default:
      print('Selección no válida.');
      return;
  }
  print('Ingrese la cantidad de chocolates:');
  int cantidad = int.parse(stdin.readLineSync() ?? '0');
  Compra compra = Compra(chocolateSeleccionado, cantidad);
  double importe = compra.calcularImporte();
  double descuento = compra.calcularDescuento();
  double totalAPagar = compra.importeAPagar();
  int caramelos = compra.cantidadCaramelos();
  print('Tipo de chocolate: ${chocolateSeleccionado.tipo}');
  print('Importe total: S/. ${importe.toStringAsFixed(2)}');
  print('Descuento: S/. ${descuento.toStringAsFixed(2)}');
  print('Importe a pagar: S/. ${totalAPagar.toStringAsFixed(2)}');
  print('Cantidad de caramelos de obsequio: $caramelos');
}
