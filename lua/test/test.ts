type X = {
  a: string;
  b: string;
};

const x: X = {
  a: "asdf",
  b: "asfd",
};

const z = x.a;

const y = Object.entries(x).map((elt) => [elt[0]]);
