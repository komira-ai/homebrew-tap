class Mopm < Formula
  desc "Package manager for Mojo"
  homepage "https://mopm.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.117/mopm-0.0.117-macos-arm64.tar.gz"
      sha256 "487307c60c0b42e342dab35109c05ff9e1ad39ee6c4d9b36a1c6ca57d07fa8b9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.117/mopm-0.0.117-linux-aarch64.tar.gz"
      sha256 "6645bfb103a008be71f5db71128aa3bc223429b01fbc642a1979ae2ebed87504"
    end
    on_intel do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.117/mopm-0.0.117-linux-x86_64.tar.gz"
      sha256 "2597ae093499536d7e5938c3fdc9c527bb498a9cf79ce52571f844464079015a"
    end
  end

  def install
    bin.install "mopm"
  end

  test do
    assert_match "mopm #{version}", shell_output("#{bin}/mopm --version")
  end
end
