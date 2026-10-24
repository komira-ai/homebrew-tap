class Mopm < Formula
  desc "Package manager for Mojo"
  homepage "https://mopm.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.42/mopm-0.0.42-macos-arm64.tar.gz"
      sha256 "37033fe795a95e2496ca04734455dc78eb25800ab3935cd2185a709ade84bdef"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.42/mopm-0.0.42-linux-aarch64.tar.gz"
      sha256 "825a0169f969da8a5a5872fa52fc4f29a62fb5a54ac83d6be8c54e007c38fcff"
    end
    on_intel do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.42/mopm-0.0.42-linux-x86_64.tar.gz"
      sha256 "b239c8826b5e08861c4905894eb03e124c52080b29ba353401966799906c284a"
    end
  end

  def install
    bin.install "mopm"
  end

  test do
    assert_match "mopm #{version}", shell_output("#{bin}/mopm --version")
  end
end
