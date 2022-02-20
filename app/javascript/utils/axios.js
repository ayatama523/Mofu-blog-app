import axios from 'axios';

const csrfToken= document.querySelector("meta[name='csrf-token']").getAttribute('content');
axios.defaults.headers.common['X-CSRF-Token'] = csrfToken;
axios.defaults.headers['X-Requested-With'] = 'XMLHttpRequest';
axios.defaults.headers['Cache-Control'] = 'no-cache,no-store,must-revalidate,max-age=-1,private';

export default axios;