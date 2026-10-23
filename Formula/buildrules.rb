class Buildrules < Formula
  desc "Hermetic Buck2 rules and toolchains"
  homepage "https://buildrules.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.31/buildrules-cli-0.0.31-macos-arm64.tar.gz"
      sha256 "5c14088ebca775e1391328e05b3dcbffea15986937886b8df9949699f75b5975"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.31/buildrules-cli-0.0.31-linux-aarch64.tar.gz"
      sha256 "24c1b4aaa5fa05690623808dd757c762414eaba7a19ad11d8c7773b596a3c03b"
    end
    on_intel do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.31/buildrules-cli-0.0.31-linux-x86_64.tar.gz"
      sha256 "43e7eafce5233541d428e8cab23b42a29e662b011c6287662bb43565236396dd"
    end
  end

  def install
    bin.install "buildrules"
  end

  test do
    assert_match "buildrules #{version}", shell_output("#{bin}/buildrules --version")
  end
end
