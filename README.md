# Geant4 Runtime

Runtime image for Geant4

This image is based on `Ubuntu 22.04 LTS`.
This image does not contain visualization components.

Geant4 is installed in
* /opt/geant4 : headers and libraries
* /opt/geant4/data : Data library

<img src="https://geant4.web.cern.ch/assets/logo/g4logo-full-500x167.png" width=80%>


Run the following command before building to prepare `Arm64` QEMU environment:
~~~~
# docker run --rm --privileged multiarch/qemu-user-static --reset -p yes -c yes
~~~~

# Supported Tags

* `latest` : latest version of Geant4
* `11.1.1` : v11.1.1
* `11.1.0` : v11.1.0
* `11.0.3` : v11.0.3
* `11.0.2` : v11.0.2
* `11.0.0` : v11.0
* `10.7.4-mt` : v10.7.p04 (MT)
* `10.7.4` : v10.7.p04
* `10.7.3-mt` : v10.7.p03 (MT)
* `10.7.3` : v10.7.p03
* `10.7.2-mt` : v10.7.p02 (MT)
* `10.7.2` : v10.7.p02
* `10.7.1` : v10.7.p01
* `10.6.3` : v10.6.p03

# License
BSD 2-Clause License

Copyright (c) 2017-2022, Koichi Murakami<br>
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

* Redistributions of source code must retain the above copyright notice, this
  list of conditions and the following disclaimer.

* Redistributions in binary form must reproduce the above copyright notice,
  this list of conditions and the following disclaimer in the documentation
  and/or other materials provided with the distribution.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

The above copyright and license notice applies to distributions of
G4Bench software in source and binary form. Some source files contain
additional notices of original copyright by their contributors;
see each source for details.
