{
  lib,
  python3Packages,
  fetchurl,
  git,
}:

python3Packages.buildPythonApplication rec {
  pname = "nox";
  version = "0.0.6";
  format = "setuptools";
  namePrefix = "";

  src = fetchurl {
    url = "mirror://pypi/n/nix-nox/nix-nox-${version}.tar.gz";
    sha256 = "1qcbhdnhdhhv7q6cqdgv0q55ic8fk18526zn2yb12x9r1s0lfp9z";
  };

  patches = [ ./nox-review-wip.patch ];

  buildInputs = [
    python3Packages.pbr
    git
  ];

  propagatedBuildInputs = with python3Packages; [
    dogpile-cache
    click
    requests
    characteristic
    setuptools
  ];

  meta = {
    homepage = "https://github.com/madjar/nox";
    description = "Tools to make nix nicer to use";
    maintainers = [ lib.maintainers.madjar ];
    license = lib.licenses.mit;
    platforms = lib.platforms.all;
  };
}
