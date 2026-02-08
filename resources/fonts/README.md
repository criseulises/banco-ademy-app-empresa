# ⚠️ Fuentes Requeridas

Este proyecto usa la fuente **Montserrat** de Google Fonts.

## 🔤 Archivos Necesarios

Coloca los siguientes archivos en esta carpeta:

```
resources/fonts/
├── Montserrat-Regular.ttf     (peso 400)
├── Montserrat-Medium.ttf      (peso 500)
├── Montserrat-SemiBold.ttf    (peso 600)
├── Montserrat-Bold.ttf        (peso 700)
└── Montserrat-ExtraBold.ttf   (peso 800)
```

## 📥 Descargar

### Método 1: Google Fonts (Recomendado)

1. Visita: https://fonts.google.com/specimen/Montserrat
2. Click en "Download family"
3. Descomprime el archivo ZIP
4. Copia los archivos `.ttf` con los pesos mencionados arriba a esta carpeta

### Método 2: GitHub

```bash
# Clonar repositorio de Google Fonts
git clone https://github.com/google/fonts.git temp_fonts

# Copiar solo Montserrat
cp temp_fonts/ofl/montserrat/Montserrat-Regular.ttf resources/fonts/
cp temp_fonts/ofl/montserrat/Montserrat-Medium.ttf resources/fonts/
cp temp_fonts/ofl/montserrat/Montserrat-SemiBold.ttf resources/fonts/
cp temp_fonts/ofl/montserrat/Montserrat-Bold.ttf resources/fonts/
cp temp_fonts/ofl/montserrat/Montserrat-ExtraBold.ttf resources/fonts/

# Limpiar
rm -rf temp_fonts
```

## ✅ Verificar Instalación

Después de copiar los archivos:

```bash
# En la raíz del proyecto
flutter clean
flutter pub get

# Si usas hot reload, haz restart
r
```

## 📝 Uso en Código

La fuente ya está configurada en el proyecto:

```dart
// En app_text_styles.dart
static const String fontFamily = 'Montserrat';

// Usar en widgets
Text(
  'Hola',
  style: TextStyle(
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.w600, // SemiBold
  ),
)
```

## ⚠️ Nota Importante

Sin estos archivos, la app usará la fuente por defecto del sistema. Para que el diseño se vea correcto según las especificaciones, estos archivos son **requeridos**.

## 📄 Licencia

Montserrat es de código abierto bajo la licencia SIL Open Font License.
Puedes usarla libremente en proyectos comerciales y personales.

Más info: https://scripts.sil.org/OFL
