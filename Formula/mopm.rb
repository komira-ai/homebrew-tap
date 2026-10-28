class Mopm < Formula
  desc "Package manager for Mojo"
  homepage "https://mopm.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.91/mopm-0.0.91-macos-arm64.tar.gz"
      sha256 "4947eeec4283c6104c5410145775144878dd5ed8e2cc221899b8a25586565dcf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.91/mopm-0.0.91-linux-aarch64.tar.gz"
      sha256 "5daf23b5290e87a4f007de0530a3ce519901c67589f34cc334667b0bb4512304"
    end
    on_intel do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.91/mopm-0.0.91-linux-x86_64.tar.gz"
      sha256 "0d0f35c7b5783f0f986e74cab0311394347fbc293bd5c810fd1813ffbdc0810c"
    end
  end

  def install
    bin.install "mopm"
  end

  test do
    assert_match "mopm #{version}", shell_output("#{bin}/mopm --version")
  end
end
