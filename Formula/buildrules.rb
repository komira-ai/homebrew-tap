class Buildrules < Formula
  desc "Hermetic Buck2 rules and toolchains"
  homepage "https://buildrules.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.29/buildrules-cli-0.0.29-macos-arm64.tar.gz"
      sha256 "1469dcbb79df9061dfdf1e5f27d420ba9b4825acac133fc1f8b8761993dc0ca7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.29/buildrules-cli-0.0.29-linux-aarch64.tar.gz"
      sha256 "9f21713f3a61982e673e56d233e62d5a136323c0f87a81b024c59d45097766dd"
    end
    on_intel do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.29/buildrules-cli-0.0.29-linux-x86_64.tar.gz"
      sha256 "57a1936750e0662911e4d503f8dda6c7a37950186f1e5f2b2541140c776d2dae"
    end
  end

  def install
    bin.install "buildrules"
  end

  test do
    assert_match "buildrules #{version}", shell_output("#{bin}/buildrules --version")
  end
end
