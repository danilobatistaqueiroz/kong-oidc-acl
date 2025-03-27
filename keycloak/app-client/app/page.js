import { BrowserRouter, Route, Link } from 'react-router-dom';
import Welcome from './welcome';
import Public from './public-page';
import UserDetails from './user-details';
import Manager from './manager';
import './App.css';

export default function Home() {
  return (
    <BrowserRouter>
      <div className="container">
        <ul>
          <li><Link to="/welcome">Welcome Page</Link></li>
          <li><Link to="/public">Public page</Link></li>
          <li><Link to="/manager">Manager page</Link></li>
          <li><Link to="/user-details">User Details</Link></li>
        </ul>
        <Route exact path="/welcome" component={Welcome} />
        <Route path="/public" component={Public} />
        <Route path="/manager" component={Manager} />
        <Route path="/user-details" component={UserDetails} />
      </div>
    </BrowserRouter>
  );
}
