// Import our custom CSS
import '../scss/styles.scss'

// Import all of Bootstrap's JS
import * as bootstrap from 'bootstrap'

// ES6 Modules or TypeScript
import Swal from 'sweetalert2'

import DataTable from 'datatables.net-dt';


window.Swal = Swal.mixin({
  title: 'Título de tu Alerta',
  text: 'Contenido de tu Alerta',
  icon: 'success', 
  customClass: {
    popup: 'my-swal-popup', // clase personalizada para el contenedor de la alerta
    title: 'my-swal-title', // clase personalizada para el título de la alerta
    content: 'my-swal-content' // clase personalizada para el contenido de la alerta
  },
  confirmButtonClass: 'btn btn-success', // clase de Bootstrap para el botón de confirmar
  cancelButtonClass: 'btn btn-secondary', // clas de Bootstrap para el botón de cancelar
});

window.DataTable = DataTable;