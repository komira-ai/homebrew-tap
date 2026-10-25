class Mopm < Formula
  desc "Package manager for Mojo"
  homepage "https://mopm.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.55/mopm-0.0.55-macos-arm64.tar.gz"
      sha256 "1b3587b0bf1dc25e7ebd6bb2a4da328a3065ef4a203ef2a934913f99d50aa9dd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.55/mopm-0.0.55-linux-aarch64.tar.gz"
      sha256 "3cad149f502cba25d6881cd13f128f84c355ad7c1df496f91e0eb4f5c76c294c"
    end
    on_intel do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.55/mopm-0.0.55-linux-x86_64.tar.gz"
      sha256 "a73b28ab7739ed9e3746c2f0078560ac8a9ca3da98c5ac5b7f37eae5fc566369"
    end
  end

  def install
    bin.install "mopm"
  end

  test do
    assert_match "mopm #{version}", shell_output("#{bin}/mopm --version")
  end
end
