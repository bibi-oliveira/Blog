import { Controller } from '@hotwired/stimulus';

export default class extends Controller{
  connect() {
    console.log('connect');
  }

  toggleForm(event){ // tem dois parâmetros
    event.preventDefault(); // quero que seja carregado novamente
    event.stopPropagation(); // não quero que seja propagado
    const form_id = event.params["form"]; //primeiro param
    const comment_body_id = event.params["body"] // segundo param
    // console.log(form_id, comment_body_id)
    const form = document.getElementById(form_id);
    form.classList.toggle("d-none"); // ao clicar ele aparece ou some
    form.classList.toggle("mt-5"); // redimensionando o tamanho
    const body = document.getElementById(comment_body_id);
    body.classList.toggle("d-none"); // ao clicar ele aparece ou some
  }
}