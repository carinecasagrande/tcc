import {StyleSheet} from 'react-native';

export default StyleSheet.create({
  content: {
    padding: 20,
    justifyContent: 'center', // Eixo primário (Y)
    alignItems: 'center', // Eixo secundário (X)
    flex: 1,
  },
  title: {
    fontWeight: 'bold',
    fontSize: 17,
    textAlign: 'center',
  },
  subtitle: {
    fontSize: 17,
    textAlign: 'center',
    fontWeight: 'normal',
    marginTop: 50,
  },
  titlePaperwork: {
    fontWeight: 'bold',
    fontSize: 17,
    textAlign: 'center',
    marginTop: 50,
  },
  subtitlePaperwork: {
    fontSize: 17,
    textAlign: 'center',
  },
  description: {
    marginTop: 50,
    fontSize: 17,
    textAlign: 'justify',
    marginLeft: 50,
  },
  location: {
    textAlign: 'center',
    marginTop: 50,
    fontSize: 17,
  },
  button: {
    backgroundColor: '#f1641f',
    padding: 18,
    borderRadius: 10,
    alignSelf: 'stretch',
    marginTop: 50,
  },
  buttonText: {
    textAlign: 'center',
    color: '#ffffff',
    fontSize: 17,
    fontWeight: 'bold',
  },
});
