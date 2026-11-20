class Mopm < Formula
  desc "Package manager for Mojo"
  homepage "https://mopm.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.119/mopm-0.0.119-macos-arm64.tar.gz"
      sha256 "0ad2f60856c79ee1df4fffb6e481df9ea7bac30e3fe4671fac0f782403f59303"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.119/mopm-0.0.119-linux-aarch64.tar.gz"
      sha256 "2122c580a412d6572e56faa97e51ed64da5bd77ea2bb69c59dd1e053ee96ab40"
    end
    on_intel do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.119/mopm-0.0.119-linux-x86_64.tar.gz"
      sha256 "fbf5dc52f45b0042ba6483d0b5a95d1db8679f90358c1f3b6aa2ab3c550f9cf1"
    end
  end

  def install
    bin.install "mopm"
  end

  test do
    assert_match "mopm #{version}", shell_output("#{bin}/mopm --version")
  end
end
