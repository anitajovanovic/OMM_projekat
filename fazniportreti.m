function fazniportreti(p,q,r,s)
  
  % Treba uneti pocetne uslove, konstante: p, q, r, s
  % f(1) predstavlja populaciju X, f(2) predstavlja toksine Y  

  x0=s*p/(q*r);
  y0=p/q;
  F = @(t,f) [(p-q.*f(2)).*f(1); r.*f(1)-s.*f(2)];  
  hold on
  if p<=0
    for i=0:0.2:1
        f0 = [i; 0];
        [t, f] = ode45(F, 0:0.0001:20, f0);
        plot(f(:,1), f(:,2), 'LineWidth', 1.5);
    end
    for i=0:0.2:1
        f0 = [i; 1];
        [t, f] = ode45(F, 0:0.0001:20, f0);
        plot(f(:,1), f(:,2), 'LineWidth', 1.5);
    end
    for i=0:0.2:1
        f0 = [1; i];
        [t, f] = ode45(F, 0:0.0001:20, f0);
        plot(f(:,1), f(:,2), 'LineWidth', 1.5);
    end
    xlim([0 1]);
    ylim([0 1]);
  else
    for i=linspace(p/q-0.5,p/q+0.5,5)
        f0 = [i; p/q-0.5];
        [t, f] = ode45(F, 0:0.0001:20, f0);
        plot(f(:,1), f(:,2), 'LineWidth', 1.5);
    end
    for j=linspace(p/q-0.5,p/q+0.5,5)
        f0 = [j; p/q+0.5];
        [t, f] = ode45(F, 0:0.0001:20, f0);
        plot(f(:,1), f(:,2), 'LineWidth', 1.5);
    end
    xlim([s*p/(q*r)-0.5 s*p/(q*r)+0.5]);
    ylim([p/q-0.5 p/q+0.5]);
    text(s*p/(q*r), p/q, "     T_{2}", 'Fontsize', 14);    
  end
  plot(s*p/(q*r), p/q, '*', 0, 0, '*');
  hold off
  title('Funkcije X i Y kroz vreme')
  xlabel('X(t)');
  ylabel('Y(t)');
  text(0, 0, 'T_{1}', 'Fontsize', 14);