import {StyleSheet} from 'react-native';

export default StyleSheet.create({
  content: {
    padding: 20,
    justifyContent: 'center', // Eixo primário (Y)
    alignItems: 'center', // Eixo secundário (X)
    flex: 1,
  },
  title: {
    fontWeight: '800',
    fontSize: 17,
    color: '#000000',
    textAlign: 'center',
  },
  subtitle: {
    textAlign: 'center',
    marginTop: 50,
    fontWeight: '500',
    fontSize: 17,
    color: '#000000',
  },
  titlePaperwork: {
    fontWeight: '800',
    fontSize: 17,
    color: '#000000',
    textAlign: 'center',
    marginTop: 50,
  },
  subtitlePaperwork: {
    textAlign: 'center',
    fontWeight: '500',
    fontSize: 17,
    color: '#000000',
  },
  description: {
    marginTop: 50,
    fontWeight: '500',
    fontSize: 17,
    color: '#000000',
    textAlign: 'justify',
    marginLeft: 50,
  },
  location: {
    textAlign: 'center',
    marginTop: 50,
    fontWeight: '500',
    fontSize: 17,
    color: '#000000',
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
    fontWeight: '800',
    fontSize: 17,
  },
});
