import { ThemeProvider } from '@material-ui/core/styles';
import React, { useEffect, useRef } from 'react';
import { Provider } from 'react-redux';
import { Route, Router, Switch } from 'react-router-dom';
import { ToastContainer } from 'react-toastify';
import 'react-toastify/dist/ReactToastify.css';
import { checkLogin } from './apis/auth';
import './assets/scss/material-dashboard-pro-react.scss?v=1.7.0';
import LoginPage from './containers/LoginPage';
import AdminLayout from './layouts/Admin';
import configureStore from './redux/configs';
import history from './utils/history';
import PrivateRoute from './utils/privateroute';
import theme from './utils/theme';
import { setRole } from './utils/userRole';
import SockJS from 'sockjs-client';
import Stomp from 'stompjs';
import { toastSocket, toastSuccess } from './helper/ToastHelper';
import { Snackbar } from '@material-ui/core';
function App() {
  const store = configureStore();
  useEffect(() => {
    checkLogin()
      .then((res) => {
        setRole(res.data.authorities[0].authority);
        if (res.data.authorities[0].authority === 'ROLE_SHIPPER') {
          localStorage.setItem('shipperID', res.data.shipperID);
          history.push('/shipper');
        } else if (res.data.authorities[0].authority === 'ROLE_ADMIN') {
          // history.push('/admin');
        }
      })
      .catch((er) => {
        localStorage.clear();
        history.replace('/login');
      });
    var sock = new SockJS('http://localhost:8080/ws-chat');
    let stompClient = Stomp.over(sock);
    sock.onopen = function () {
      console.log('open');
    };

    stompClient.connect({}, function (frame) {
      stompClient.subscribe('/topic/group', function (greeting) {
        toastSocket(JSON.parse(greeting.body));
        //you can execute any function here
      });
    });
  }, []);

  return (
    <Provider store={store}>
      <ThemeProvider theme={theme}>
        <Router history={history}>
          <ToastContainer
            position='top-center'
            autoClose={5000}
            limit={1}
            hideProgressBar={true}
            newestOnTop={false}
            closeOnClick
            rtl={false}
            pauseOnFocusLoss
            draggable
            pauseOnHover
            className='text-center'
          />
          <Switch>
            <Route path='/login' component={LoginPage} />
            <PrivateRoute path='/' component={() => <AdminLayout />} />
            {/* <PrivateRoute path='/shipper' component={AdminLayout} /> */}
            {/* <Redirect from='/' to='/admin' /> */}
          </Switch>
        </Router>
      </ThemeProvider>
    </Provider>
  );
}
export default App;
