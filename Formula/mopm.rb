class Mopm < Formula
  desc "Package manager for Mojo"
  homepage "https://mopm.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.78/mopm-0.0.78-macos-arm64.tar.gz"
      sha256 "fc09e9bbb19dda579d90862d4ed51010282ad01776d5ab4040891068e58fd46e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.78/mopm-0.0.78-linux-aarch64.tar.gz"
      sha256 "70c1dfb3a24569f5de14cf5609d3e432d238488191acb8f2d8d4f5b7aa77e392"
    end
    on_intel do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.78/mopm-0.0.78-linux-x86_64.tar.gz"
      sha256 "7f54ca8a1219adb713fcdb2998052a28782672548d603d2016a57578f7fb097d"
    end
  end

  def install
    bin.install "mopm"
  end

  test do
    assert_match "mopm #{version}", shell_output("#{bin}/mopm --version")
  end
end
