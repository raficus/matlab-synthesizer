function value = lookup(key)

% returns the properties of the note corresponding to the keyboard key
% properties include the note name, register, and numerical frequency
% initialize the struct values for the keyboard
% note corresponds to pitch class
% reg corresponds to pitch register
% freq corresponds to actual frequency
% frequencies are approximately 1.0595 times the previous frequency
% this corresponds to a multiplicative factor of the twelfth root of 2 
% based on the equal-tempered scale

q.note = 'B '; q.reg = 3; q.freq = 246.942;
a.note = 'C '; a.reg = 4; a.freq = 261.626;
w.note = 'C# '; w.reg = 4; w.freq = 277.183; 
s.note = 'D '; s.reg = 4; s.freq = 293.665;
e.note = 'D# '; e.reg = 4; e.freq = 311.127;
d.note = 'E '; d.reg = 4; d.freq = 329.628;
f.note = 'F '; f.reg = 4; f.freq = 348.228;
t.note = 'F# '; t.reg = 4; t.freq = 369.628;
g.note = 'G '; g.reg = 4; g.freq = 391.995;
y.note = 'G# '; y.reg = 4; y.freq = 415.305;
h.note = 'A '; h.reg = 4; h.freq = 440.000;
u.note = 'A# '; u.reg = 4; u.freq = 466.164;
j.note = 'B '; j.reg = 4; j.freq = 493.883;
k.note = 'C '; k.reg = 5; k.freq = 523.251;
o.note = 'C# '; o.reg = 5; o.freq = 554.365;
l.note = 'D '; l.reg = 5; l.freq = 587.330;
p.note = 'D# '; p.reg = 5; p.freq = 622.254;
sc.note = 'E '; sc.reg = 5; sc.freq = 659.256;
sq.note = 'F '; sq.reg = 5; sq.freq = 696.456;
rb.note = 'F# '; rb.reg = 5; rb.freq = 739.256;

% chords
%A B C D E F G A B C 
z.note = 'C-E-G ';
z.reg = 4;
z.freq1 = 261.626; 
z.freq2 = 329.628; 
z.freq3 = 391.995; 
z.freq = -1;

x.note = 'D-F-A '; 
x.reg = 4; 
x.freq1 = 293.665; 
x.freq2 = 348.228; 
x.freq3 = 440.000; 
x.freq = -1;

c.note = 'E-G-B '; 
c.reg = 4; 
c.freq1 = 329.628; 
c.freq2 = 391.995; 
c.freq3 = 493.883; 
c.freq = -1;

v.note = 'F-A-C '; 
v.reg = 4; 
v.freq1 = 348.228; 
v.freq2 = 440.000; 
v.freq3 = 523.251; 
v.freq = -1;

b.note = 'G-B-D '; 
b.reg = 4; 
b.freq1 = 391.995; 
b.freq2 = 493.883; 
b.freq3 = 587.330; 
b.freq = -1;

n.note = 'A-C-E '; 
n.reg = 4; 
n.freq1 = 440.000; 
n.freq2 = 523.251; 
n.freq3 = 659.256; 
n.freq = -1;

m.note = 'B-D-F '; 
m.reg = 4; 
m.freq1 = 493.883; 
m.freq2 = 587.330; 
m.freq3 = 696.456; 
m.freq = -1;

% stub for errors
no.note = 'X '; 
no.reg = 0; 
no.freq = 0; 

switch (key) % converts key to lowercase
    % based on the keyboard key pressed, returns corresponding note
    case 113; value = q;
    case 097; value = a;
    case 119 ; value = w;
    case 115 ; value = s;
    case 101 ; value = e;
    case 100 ; value = d;
    case 102 ; value = f;
    case 116 ; value = t;
    case 103 ; value = g;
    case 121 ; value = y;
    case 104 ; value = h;
    case 117 ; value = u;
    case 106 ; value = j;
    case 107 ; value = k;
    case 111 ; value = o;
    case 108 ; value = l;
    case 112 ; value = p;
    case 059 ; value = sc; % semi-colon
    case 039 ; value = sq; % double-quotes, escape characters used accordingly
    case 093 ; value = rb; % right-bracket
    case 122 ; value = z;
    case 120 ; value = x;
    case 099 ; value = c;
    case 118 ; value = v;
    case 098 ; value = b;
    case 110 ; value = n;
    case 109 ; value = m; 
    otherwise
        value = no;
end