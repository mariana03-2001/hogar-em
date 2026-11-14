# Hogar E&M

App web para organizar la casa entre dos: pendientes (tuyos, de tu pareja o de los dos), rutinas de aseo por turnos, lista de compras y comparador de precios entre supermercados. Los cambios se ven al instante en los dos celulares.

- **Datos:** Supabase (plan gratuito).
- **Página:** cualquier hosting de archivos estáticos (GitHub Pages, Netlify, Vercel).
- **Sin servidor propio:** son archivos HTML/JS.

## Archivos

| Archivo | Para qué |
|---|---|
| `index.html` | La app |
| `config.js` | La URL y la *anon key* de tu proyecto de Supabase |
| `supabase.sql` | Crea la tabla y los permisos en Supabase |
| `manifest.webmanifest`, `icon*.png`, `icon.svg` | Ícono y nombre al agregarla a la pantalla de inicio |

## 1. Supabase

1. Crea una cuenta en https://supabase.com y luego **New project**. Elige la región más cercana y guarda la contraseña de la base de datos.
2. Ve a **SQL Editor**, toca **New query**, pega todo `supabase.sql` y toca **Run**.
3. En **Authentication → Users → Add user → Create new user**, crea una cuenta para cada uno (correo y contraseña) y marca **Auto Confirm User**.
4. En **Authentication → Sign In / Providers → Email**, desactiva **Allow new users to sign up**. Así nadie más puede crearse una cuenta.
5. En **Project Settings → API** (o **Data API / API Keys**), copia:
   - **Project URL**: `https://xxxx.supabase.co`
   - **anon public** key
6. Pega esos dos valores en `config.js`.

La *anon key* puede ir en la página sin problema. Lo que protege los datos es que solo las dos cuentas creadas pueden leer y escribir (lo define `supabase.sql`). **Nunca** pongas la `service_role` key en `config.js`.

## 2. Publicar la página (GitHub Pages)

1. En GitHub, crea un repositorio nuevo (por ejemplo `hogar-em`).
2. Toca **Add file → Upload files**, arrastra todos los archivos de esta carpeta y toca **Commit changes**.
3. Ve a **Settings → Pages**. En **Source** elige *Deploy from a branch*, luego la rama `main` y la carpeta `/ (root)`, y toca **Save**.
4. En uno o dos minutos la app queda en `https://TU-USUARIO.github.io/hogar-em/`.

> Con un repositorio público, cualquiera puede ver el código (incluida la anon key), pero no sus datos, porque estos piden iniciar sesión. Si prefieren que no se vea, usen un repositorio privado (GitHub Pages en repositorios privados requiere un plan pago) o Netlify (opción siguiente).

**Alternativa sin GitHub:** en https://app.netlify.com/drop arrastra la carpeta completa y te da una dirección al instante.

## 3. En los celulares

1. Abre la dirección de la app y entra con tu correo y contraseña.
2. Agrégala a la pantalla de inicio:
   - **iPhone (Safari):** botón Compartir, luego **Agregar a pantalla de inicio**.
   - **Android (Chrome):** menú ⋮, luego **Agregar a la pantalla principal** o **Instalar app**.
3. Arriba, en «Soy», cada uno elige su lado (Persona 1 o Persona 2). Queda ligado a su cuenta.
4. En **Inicio → Ajustes del hogar** pongan sus nombres, la moneda y sus supermercados.

## Notas

- La sesión queda guardada en el celular. «Salir» cierra la sesión en ese celular.
- Al volver a abrir la app, recarga lo último automáticamente.
- El plan gratuito de Supabase pausa los proyectos que pasan una semana sin uso. Si pasa, entra a supabase.com y toca **Restore**. Si usan la app seguido, no ocurre.
